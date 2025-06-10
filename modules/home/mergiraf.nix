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
        "* merge=mergiraf"
      ];
    };
  };
}
