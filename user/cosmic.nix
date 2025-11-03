{ lib, systemSettings, ... }:
let
  cfg.enable = systemSettings.de == "cosmic";

  setTheme = is_dark: "echo ${is_dark} > ~/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark";
  setDarkTheme = setTheme "true";
  setLightTheme = setTheme "false";
in
{
  home.packages = [
  ];

  programs.zsh.shellAliases = lib.mkIf cfg.enable {
    lite = setLightTheme;
    dark = setDarkTheme;
  };
}
