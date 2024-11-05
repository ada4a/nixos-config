{ systemSettings, ... }:
let
  de =
    let
      inherit (systemSettings) de;
      match_de = {
        "cosmic" = ./cosmic.nix;
        "plasma" = ./plasma.nix;
      };
    in
    builtins.getAttr de match_de;

in
{
  imports = [ de ];
}
