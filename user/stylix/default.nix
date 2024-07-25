{
  userSettings,
  pkgs,
  ...
}: let
  fontToNameAndPackage = let
    fontToPackage = {
      "Cascadia Code" = pkgs.cascadia-code;
    };
  in (font: {
    name = font;
    package = builtins.getAttr font fontToPackage;
  });
in {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    image = ./dummy.jpg;

    fonts = {
      monospace = fontToNameAndPackage userSettings.fonts.mono;
    };
  };
}
