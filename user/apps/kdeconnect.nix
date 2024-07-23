{pkgs, ...}: {
  services.kdeconnect = {
    enable = true;
    # use the Plasma 6 package
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = true;
  };

  # Hide all .desktop entries, except for org.kde.kdeconnect.settings
  # https://github.com/Misterio77/nix-config/blob/main/home/misterio/features/desktop/common/kdeconnect.nix#L12
  xdg.desktopEntries = {
    "org.kde.kdeconnect.sms" = {
      exec = "";
      name = "KDE Connect SMS";
      settings.NoDisplay = "true";
    };
    "org.kde.kdeconnect.nonplasma" = {
      exec = "";
      name = "KDE Connect Indicator";
      settings.NoDisplay = "true";
    };
    "org.kde.kdeconnect.app" = {
      exec = "";
      name = "KDE Connect";
      settings.NoDisplay = "true";
    };
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
