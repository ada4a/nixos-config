{
  lib,
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

    targets = {
      # this puts the config file even though I don't use anything Hyprland?
      hyprpaper.enable = lib.mkForce false;
      # breaks without this disabled
      hyprland.enable = lib.mkForce false;

      # turn this off while I'm still figuring things out with (kickstart.)nixvim..
      nixvim.enable = lib.mkForce false;
      # breaks (init.lua gets replaced) without this disabled
      vim.enable = lib.mkForce false;
    };
  };
}
