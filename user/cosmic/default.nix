{ systemSettings, ... }:
let
  cfg.enable = systemSettings.de == "cosmic";
in
{
  home.packages = [
  ];

  home.file.toggleDarkMode = {
    enable = cfg.enable;
    source = ./toggle_dark_mode.sh;
    target = ".local/bin/toggle_dark_mode.sh";
  };
}
