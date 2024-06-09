{
  userSettings,
  ...
}: {
  progams.firefox.profiles."${userSettings.username}" = {
    isDefault = true;
    search = {
      default = "DuckDuckGo";
      provateDefault = "DuckDuckGo";
      force = true;
    };
    settings = {
      "widget.use-xdg-desktop-portal.file-picker" = "1";
    };
  };
}
