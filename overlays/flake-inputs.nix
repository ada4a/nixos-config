{inputs, ...}:
# For every flake input, aliases on of
# - 'inputs.${flake}.packages.${pkgs.system}'
# - 'inputs.${flake}.legacyPackages.${pkgs.system}'
# to 'pkgs.inputs.${flake}'
# https://github.com/Misterio77/nix-config/blob/main/overlays/default.nix#L8-L20
final: _: {
  inputs =
    builtins.mapAttrs (
      _: flake: let
        legacyPackages = (flake.legacyPackages or {}).${final.system} or {};
        packages = (flake.packages or {}).${final.system} or {};
      in
        if legacyPackages != {}
        then legacyPackages
        else packages
    )
    inputs;
}
