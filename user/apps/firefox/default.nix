{
  firefox-addons,
  systemSettings,
  userSettings,
  ...
}: {
  programs.firefox.profiles."${userSettings.username}" = {
    isDefault = true;
    search = {
      force = true;
      default = "DuckDuckGo";
      privateDefault = "DuckDuckGo";
    };
    settings = {
      "widget.use-xdg-desktop-portal.file-picker" = "1";
    };
    extensions = with firefox-addons.packages.${systemSettings.system}; [
      bitwarden
      darkreader
      simple-tab-groups
      ublock-origin
      vimium
    ];
  };
}
