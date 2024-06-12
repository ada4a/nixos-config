{
  inputs,
  systemSettings,
  userSettings,
  ...
}: {
  programs.firefox.profiles."${userSettings.username}" = {
    isDefault = true;
    search = {
      default = "DuckDuckGo";
      provateDefault = "DuckDuckGo";
      force = true;
    };
    settings = {
      "widget.use-xdg-desktop-portal.file-picker" = "1";
    };
    extensions = with inputs.firefox-addons.packages.${systemSettings.system}; [
      bitwarden
      darkreader
      simple-tab-groups
      ublock-origin
      vimium
    ];
  };
}
