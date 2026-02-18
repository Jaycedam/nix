{ pkgs, ... }: {
  imports = [
    ./niri.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./chromium.nix
    ./gaming.nix
    ./keyboard.nix
    ./greeter.nix
    ./virtualization.nix
    ./homelab.nix
    ../common/stylix.nix
  ];

  environment.systemPackages = with pkgs; [ home-manager ];
}
