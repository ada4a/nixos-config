{ pkgs, ... }:
{
  services.tldr-update = {
    enable = true;
    package = pkgs.tlrc;
  };
}
