{ pkgs, ... }:
{
  home.packages = [ pkgs.flatpak ];
  xdg.portal.config.common.default = "cosmic";
  services.flatpak = {
    enable = true;
    packages = [
      "md.obsidian.Obsidian"
      "com.spotify.Client"
      "com.discordapp.Discord"
      "org.signal.Signal"
    ];
    update.onActivation = true;
  };
}
