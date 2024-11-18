{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.programs.mergiraf;
in
{
  options = {
    enable = lib.mkEnableOption "" // {
      description = ''
        A syntax-aware git merge driver for a growing collection of programming languages and file formats.
        See <https://codeberg.org/mergiraf/mergiraf>.
      '';

      package = lib.mkPackageOption pkgs "mergiraf";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    programs.git = {

      extraConfig = {
        merge.mergiraf = {
          name = "mergiraf";
          driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P";
        };
      };

      attributes = [
        "*.java merge=mergiraf"
        "*.rs merge=mergiraf"
        "*.go merge=mergiraf"
        "*.js merge=mergiraf"
        "*.jsx merge=mergiraf"
        "*.json merge=mergiraf"
        "*.yml merge=mergiraf"
        "*.yaml merge=mergiraf"
        "*.html merge=mergiraf"
        "*.htm merge=mergiraf"
        "*.xhtml merge=mergiraf"
        "*.xml merge=mergiraf"
        "*.c merge=mergiraf"
        "*.h merge=mergiraf"
        "*.cpp merge=mergiraf"
        "*.hpp merge=mergiraf"
        "*.cs merge=mergiraf"
      ];
    };
  };
}
