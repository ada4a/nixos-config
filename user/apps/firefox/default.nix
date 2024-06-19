{
  firefox-addons,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./engines.nix
  ];

  programs.firefox.enable = true;
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
