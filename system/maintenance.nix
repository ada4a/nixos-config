{ flakePath, ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "Mon,Thu";
    flake = flakePath;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
