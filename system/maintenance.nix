{flake_path, ...}: {
  nixos.autoUpgrade = {
    enable = true;
    dates = "3 days";
    flake = flake_path;
  };

  nix.optimise = {
    automatic = true;
    dates = ["weekly"];
  };
}
