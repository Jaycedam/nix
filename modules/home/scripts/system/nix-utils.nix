{ pkgs, ... }:

pkgs.writeShellScriptBin "ns" ''
  set -euo pipefail

  RED='\033[31m'
  GREEN='\033[32m'
  YELLOW='\033[33m'
  MAGENTA='\033[35m'
  RESET='\033[0m'
  ARROW="''${MAGENTA}==>''${RESET}"

  DIR="$HOME/dev/nix"
  GC=false
  USER_PROFILE=""
  HOST_PROFILE=""

  usage() {
      echo -e "''${GREEN}Usage:''${RESET} ns [''${YELLOW}OPTIONS''${RESET}] <''${YELLOW}update''${RESET}|''${YELLOW}switch''${RESET}|''${YELLOW}clean''${RESET}|''${YELLOW}news''${RESET}] [''${YELLOW}home''${RESET}|''${YELLOW}nixos''${RESET}]"
      echo ""
      echo -e "''${GREEN}Actions:''${RESET}"
      echo -e "  ''${YELLOW}update''${RESET}  Update the configuration then rebuilds"
      echo -e "  ''${YELLOW}switch''${RESET}  Apply the configuration"
      echo -e "  ''${YELLOW}clean''${RESET}   Clean old generations (keeps last 5) and run garbage collection"
      echo -e "  ''${YELLOW}news''${RESET}    Show home-manager news (no target required)"
      echo ""
      echo -e "''${GREEN}Targets (optional):''${RESET}"
      echo -e "  ''${YELLOW}home''${RESET}    Manage home-manager configuration"
      echo -e "  ''${YELLOW}nixos''${RESET}   Manage NixOS system configuration"
      echo ""
      echo "If no target is specified, both home and nixos are applied."
      echo ""
      echo -e "''${GREEN}Options:''${RESET}"
      echo -e "  ''${YELLOW}--config''${RESET}, ''${YELLOW}-c''${RESET} <dir>   Override the nix config directory (default: \$HOME/dev/nix)"
      echo -e "  ''${YELLOW}--user''${RESET} <name>        Use a specific home-manager profile"
      echo -e "  ''${YELLOW}--host''${RESET} <name>        Use a specific nixos profile"
      echo -e "  ''${YELLOW}--gc''${RESET}                Run garbage collection after update/switch"
      echo ""
      echo -e "''${GREEN}Examples:''${RESET}"
      echo -e "  ns ''${YELLOW}update''${RESET}                       Update both home and nixos"
      echo -e "  ns ''${YELLOW}switch''${RESET} ''${YELLOW}home''${RESET}                Switch home-manager only"
      echo -e "  ns ''${YELLOW}clean''${RESET} ''${YELLOW}nixos''${RESET}                Clean nixos generations only"
      echo -e "  ns ''${YELLOW}news''${RESET}                         Show home-manager news"
      echo -e "  ns ''${YELLOW}update''${RESET} ''${YELLOW}--gc''${RESET}                Update and run garbage collection"
      echo -e "  ns ''${YELLOW}switch''${RESET} ''${YELLOW}home''${RESET} ''${YELLOW}--user''${RESET} jay        Switch home-manager with jay profile"
      echo -e "  ns ''${YELLOW}switch''${RESET} ''${YELLOW}nixos''${RESET} ''${YELLOW}--host''${RESET} laptop    Switch nixos with laptop profile"
      echo -e "  ns ''${YELLOW}update''${RESET} ''${YELLOW}nixos''${RESET} ''${YELLOW}-c''${RESET} /custom/path"
  }

  args=()
  while [[ $# -gt 0 ]]; do
      case "$1" in
      --config | -c)
          if [[ -z "''${2:-}" ]]; then
              echo -e "''${RED}Error:''${RESET} --config requires a directory argument"
              exit 1
          fi
          DIR="$2"
          shift 2
          ;;
      --user)
          if [[ -z "''${2:-}" ]]; then
              echo -e "''${RED}Error:''${RESET} --user requires a profile name"
              exit 1
          fi
          USER_PROFILE="$2"
          shift 2
          ;;
      --host)
          if [[ -z "''${2:-}" ]]; then
              echo -e "''${RED}Error:''${RESET} --host requires a profile name"
              exit 1
          fi
          HOST_PROFILE="$2"
          shift 2
          ;;
      --gc)
          GC=true
          shift
          ;;
      help | -h)
          usage
          exit 0
          ;;
      *)
          args+=("$1")
          shift
          ;;
      esac
  done

  set -- "''${args[@]}"

  if [[ $# -lt 1 ]]; then
      echo -e "''${RED}Error:''${RESET} Missing required argument"
      usage
      exit 1
  fi

  action="''$1"
  target="''${2:-}"

  if [[ "$action" != "update" && "$action" != "switch" && "$action" != "clean" && "$action" != "news" ]]; then
      echo -e "''${RED}Error:''${RESET} First argument must be 'update', 'switch', 'clean', or 'news'"
      usage
      exit 1
  fi

  if [[ "$action" == "news" ]]; then
      if [[ -n "$USER_PROFILE" ]]; then
          home-manager news --flake "$DIR#$USER_PROFILE"
      else
          home-manager news --flake "$DIR"
      fi
      exit 0
  fi

  if [[ -n "$target" && "$target" != "home" && "$target" != "nixos" ]]; then
      echo -e "''${RED}Error:''${RESET} Second argument must be 'home' or 'nixos'"
      usage
      exit 1
  fi

  echo -e "$ARROW Dir: $DIR"
  if [[ -n "$USER_PROFILE" ]]; then
      echo -e "$ARROW User profile: $USER_PROFILE"
  fi
  if [[ -n "$HOST_PROFILE" ]]; then
      echo -e "$ARROW Host profile: $HOST_PROFILE"
  fi

  cleanup() {
      local target="$1"
      if [[ -z "$target" ]]; then
          cleanup nixos
          cleanup home
          return
      fi
      if [[ "$target" == "home" ]]; then
          echo -e "$ARROW [$target] Cleaning old generations..."
          nix-env --delete-generations +5 -p "$HOME/.local/state/nix/profiles/home-manager" >/dev/null
          nix-collect-garbage >/dev/null
      elif [[ "$target" == "nixos" ]]; then
          echo -e "$ARROW [$target] Cleaning old generations..."
          sudo nix-env --delete-generations +5 -p /nix/var/nix/profiles/system >/dev/null
          sudo nix-collect-garbage >/dev/null
      fi
  }

  run_home() {
      local action="$1"
      local flake_path="$DIR"
      if [[ -n "$USER_PROFILE" ]]; then
          flake_path="$DIR#$USER_PROFILE"
      fi
      echo -e "$ARROW [home-manager] Running $action..."
      if [[ "$action" == "update" ]]; then
          nix flake update "$DIR" >/dev/null
          home-manager switch -b backup --flake "$flake_path" >/dev/null
      elif [[ "$action" == "switch" ]]; then
          home-manager switch -b backup --flake "$flake_path" >/dev/null
      elif [[ "$action" == "clean" ]]; then
          cleanup home
          return
      fi
      if [[ "$GC" == "true" ]]; then
          cleanup home
      fi
  }

  run_nixos() {
      local action="$1"
      local flake_path="$DIR"
      if [[ -n "$HOST_PROFILE" ]]; then
          flake_path="$DIR#$HOST_PROFILE"
      fi
      echo -e "$ARROW [nixos] Running $action..."
      if [[ "$action" == "update" ]]; then
          nix flake update "$DIR" >/dev/null
          sudo nixos-rebuild switch --flake "$flake_path" >/dev/null
      elif [[ "$action" == "switch" ]]; then
          sudo nixos-rebuild switch --flake "$flake_path" >/dev/null
      elif [[ "$action" == "clean" ]]; then
          cleanup nixos
          return
      fi
      if [[ "$GC" == "true" ]]; then
          cleanup nixos
      fi
  }

  case "$target" in
  home)
      run_home "$action"
      ;;
  nixos)
      run_nixos "$action"
      ;;
  *)
      run_nixos "$action"
      run_home "$action"
      ;;
  esac
''
