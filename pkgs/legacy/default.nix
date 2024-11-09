{ pkgs, ... }:
let
  inherit (pkgs) callPackage;
in
{
  mergiraf = callPackage ./mergiraf { };
}
