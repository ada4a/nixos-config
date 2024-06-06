{pkgs, ...}: {
  nix = {
    package = pkgs.nixFlakes;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    # Opinionated: disable global registry^[1]
    flake-registry = "";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
