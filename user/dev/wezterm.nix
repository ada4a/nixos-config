{ lib, userSettings, ... }:
{
  programs.wezterm = lib.mkIf (userSettings.terminal == "wezterm") { enable = true; };
}
