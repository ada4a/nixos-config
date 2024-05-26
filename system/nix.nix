{pkgs, ...}: {
  nix = {
    package = pkgs.nixFlakes;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
