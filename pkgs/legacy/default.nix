{
  pkgs,
  ...
}:
let
  inherit (pkgs) callPackage;
in
{
  clipboard-manager = callPackage ./clipboard-manager.nix { };
  memreserver = callPackage ./memreserver.nix { };
}
