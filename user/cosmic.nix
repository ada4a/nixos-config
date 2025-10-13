{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cosmic-ext-applet-external-monitor-brightness
  ];
}
