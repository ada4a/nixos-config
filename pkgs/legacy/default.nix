{
  pkgs,
  ...
}:
let
  inherit (pkgs) callPackage;
in
{
  memreserver = callPackage ./memreserver.nix { };
}
