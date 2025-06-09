{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.mprocs ];

  xdg.configFile."mprocs/mprocs.yaml".text = lib.generators.toYAML { } { scrollback = 10000; };
}
