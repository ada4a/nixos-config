{ pkgs, ... }:
let
  inherit (pkgs) callPackage;
in
{
  cosmic-ext-applet-external-monitor-brightness =
    callPackage ./cosmic-ext-applet-external-monitor-brightness.nix
      { };
}
