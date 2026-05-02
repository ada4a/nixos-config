{
  pkgs,
  lib,
  config,
  userSettings,
  systemSettings,
  ...
}:
let
  firefox-addons = pkgs.inputs.firefox-addons;
in
{
  imports = [ ./engines.nix ];

  programs.firefox.enable = true;
  # FIXME: remove once stateVersion is updated to 26.05+
  programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
  programs.firefox.profiles."${userSettings.username}" = {
    id = 0; # implies `isDefault = true;`
    search = {
      force = true;
      default = "ddg";
      privateDefault = "ddg";
    };
    settings = {
      # kill it with fire
      browser.ml.enable = false;
      browser.ml.chat = {
        enabled = false;
        menu = false;
        page.footerBadge = false;
        page.menuBade = false;
      };
      browser.search.visualSearch.featureGate = false;
      browser.tabs.groups.smart.enabled = false;
      extensions.ml.enabled = false;

      "widget.use-xdg-desktop-portal.file-picker" = "1";
    };
    extensions.packages =
      with firefox-addons;
      [
        british-english-dictionary-2
        clearurls
        darkreader
        dictionary-german
        duckduckgo-privacy-essentials
        indie-wiki-buddy
        onepassword-password-manager
        return-youtube-dislikes
        simple-tab-groups
        ublock-origin
        quality-of-rwth
        whowrotethat
      ]
      ++ lib.optionals (systemSettings.de == "plasma") plasma-integration;
  };

}
