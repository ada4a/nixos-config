{...}: {
  imports = [(f: import ./rc2nix-ed.nix)];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    panels = [
      {
        location = "bottom";
        floating = true;
        height = 42;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.showActivityManager"
          {
            name = "org.kde.plasma.icontasks";
            config.General = {
              launchers = [
                "preferred://browser"
                "applications:obsidian.desktop"
                # FIXME this really should be preferred://terminal or something
                "applications:org.wezfurlong.wezterm.desktop"
                "preferred://filemanager"
                # FIXME this really should be preferred://editor or something
                "applications:nvim.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
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
