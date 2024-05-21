{pkgs, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-generations 7d";
    };
  };
}
