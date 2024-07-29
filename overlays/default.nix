{ inputs, ... }:
let
  # A helper function for overlays which consist of just applying a patch (or several)
  addPatches =
    pkg: patches:
    pkg.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or [ ]) ++ patches;
    });
in
{
  # For every flake input, aliases one of
  # - 'inputs.${flake}.packages.${pkgs.system}'
  # - 'inputs.${flake}.legacyPackages.${pkgs.system}'
  # to 'pkgs.inputs.${flake}'
  # https://github.com/Misterio77/nix-config/blob/main/overlays/default.nix#L8-L20
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };

  modifications = final: prev: {
    # HACK to lower scrolling speed on Wayland
    # relevant issue: https://github.com/wez/wezterm/issues/3142
    # patch itself (and, originally, the overlay to apply it) graciously provided by @SuperSandro2000 (thanks again!)
    # patch presented in https://github.com/wez/wezterm/issues/3142#issuecomment-1821787347
    wezterm = addPatches prev.wezterm.overrideAttrs [ ./wezterm-scroll-sensitivity.diff ];
  };
}
