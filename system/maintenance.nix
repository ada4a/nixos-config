{ flakePath, ... }:
let
  randomizedDelaySec = "45min";
in
{
  system.autoUpgrade = {
    enable = true;
    dates = "Mon,Thu";
    flake = flakePath;
    inherit randomizedDelaySec;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
    inherit randomizedDelaySec;
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
}
