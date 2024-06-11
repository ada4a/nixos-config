{pkgs, ...}: let
  inherit (pkgs) callPackage;
in {
  ddcci-plasmoid-backend = callPackage ./ddcci-plasmoid-backend {};
  ddcci-plasmoid = callPackage ./ddcci-plasmoid {};
}
