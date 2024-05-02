{
  pkgs,
  userSettings,
  ...
}: {
  # NOTE i should be able to transfer these setting to Floorp if/when their configuration is merged in Home-Manager
  # Reference: https://discourse.nixos.org/t/firefox-extensions-with-home-manager/34108
  progams.firefox = {
    #package = pkgs.floorp;
    profiles."${userSettings.username}" = {
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
  };
}
