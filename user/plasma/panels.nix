{
  config,
  userSettings,
  ...
}: let
  # Unfortunately, there isn't a preferred://terminal, so emulate that
  # by mapping userSettings.terminal to the corresponding .desktop file
  terminal = let
    inherit (userSettings) terminal;
    match_terminal = {
      "konsole" = "applications:org.kde.konsole.desktop";
      "wezterm" = "applications:org.wezfurlong.wezterm.desktop";
    };
  in
    builtins.getAttr terminal match_terminal;

  # similarly with preferred://terminal, but map $EDITOR instead
  editor = let
    editor = config.home.sessionVariables.EDITOR;
    match_editor = {
      "nvim" = "applications:nvim.desktop";
    };
  in
    builtins.getAttr editor match_editor;
in {
  programs.plasma.panels = [
    {
      location = "bottom";
      floating = true;
      height = 42;
      screen = 0;
      widgets = [
        "org.kde.plasma.kickoff"
        "org.kde.plasma.showActivityManager"
        {
          iconTasks = {
            launchers = [
              "preferred://browser"
              "applications:obsidian.desktop"
              terminal # see definition above (in "let in"-block)
              "preferred://filemanager"
              editor # ditto
            ];
            behavior.wheel.switchBetweenTasks = false;
          };
        }
        "org.kde.plasma.marginsseparator"
        "de.davidhi.ddcci-brightness"
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
}
