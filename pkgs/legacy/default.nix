{pkgs, ...}: let
  inherit (pkgs) callPackage;
in rec {
  ddcci-plasmoid-backend = callPackage ./ddcci-plasmoid-backend {};
  ddcci-plasmoid = callPackage ./ddcci-plasmoid {inherit ddcci-plasmoid-backend;};
}
