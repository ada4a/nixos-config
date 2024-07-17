{
  lib,
  config,
  userSettings,
  ...
}: {
  programs.wezterm = lib.mkIf (userSettings.terminal == "wezterm") {
    enable = true;
  };

  # HACK to lower scrolling speed on Wayland
  # relevant issue: https://github.com/wez/wezterm/issues/3142
  # overlay to apply the patch graciously provided by @SuperSandro2000 (thanks again!)
  # patch itself presented in https://github.com/wez/wezterm/issues/3142#issuecomment-1821787347
  nixpkgs.overlays = lib.mkIf config.programs.wezterm.enable [
    (final: prev: {
      wezterm = prev.wezterm.overrideAttrs ({patches ? [], ...}: {
        patches = patches ++ [./wayland-scroll-sensitivity.diff];
      });
    })
  ];
}
