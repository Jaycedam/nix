{ ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  # Automatically run the nix store optimiser at a specific time.
  nix.optimise.automatic = true;
}
