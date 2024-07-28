{
  userSettings,
  pkgs,
  ...
}: let
  font_pkgs = let
    fonts = builtins.attrValues userSettings.fonts;
    match_font = {"Cascadia Code" = pkgs.cascadia-code;};
  in
    builtins.map (font: builtins.getAttr font match_font) fonts;
in {
  home.packages = font_pkgs;

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [userSettings.fonts.mono];
    };
  };
}
