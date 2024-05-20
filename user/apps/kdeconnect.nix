{pkgs, ...}: {
  services.kdeconnect = {
    enable = true;
    # use the Plasma 6 package
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = true;
  };

  # Workaround for Failed to restart syncthingtray.service: Unit tray.target not found.
  # Reference: https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = ["graphical-session-pre.target"];
    };
  };
}
