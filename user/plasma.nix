{...}: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    configFile = {
      # TODO switch to the high-level input module once it lands
      # https://github.com/nix-community/plasma-manager/pull/123
      "kcminputrc"."Libinput/1267/12553/ELAN2204:00 04F3:3109 Touchpad" = {
        "ClickMethod" = 2; # tap-to-click
        "NaturalScroll" = true;
        "PointerAcceleration" = 0.200;
      };
      # disable the hot corner (aka. Screen Edge)
      "kwinrc"."Effect-overview"."BorderActivate" = 9;
    };
    panels = [
      {
        location = "bottom";
        floating = true;
        height = 42;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.showActivityManager"
          {
            iconTasks = {
              launchers = [
                "preferred://browser"
                "applications:obsidian.desktop"
                # FIXME this really should be preferred://terminal or something
                "applications:org.wezfurlong.wezterm.desktop"
                "preferred://filemanager"
                # FIXME this really should be preferred://editor or something
                "applications:nvim.desktop"
              ];
              behavior.wheel.switchBetweenTasks = false;
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            systemTray = {
              items.configs.battery.showPercentage = true;
            };
          }
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
    workspace = {
      clickItemTo = "select";
    };
  };
}
