{
  pkgs,
  userSettings,
  ...
}:
let
  firefox-addons = pkgs.inputs.firefox-addons.default;
in
{
  imports = [ ./engines.nix ];

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
    extensions = with firefox-addons; [
      bitwarden
      british-english-dictionary-2
      clearurls
      darkreader
      dictionary-german
      duckduckgo-privacy-essentials
      indie-wiki-buddy
      plasma-integration
      return-youtube-dislikes
      simple-tab-groups
      ublock-origin
      whowrotethat
    ];
  };
}
