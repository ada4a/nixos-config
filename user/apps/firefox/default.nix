{
  pkgs,
  lib,
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
  programs.firefox.profiles =
    let
      common = {
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
        extensions.packages = with firefox-addons; [
          bitwarden
          british-english-dictionary-2
          clearurls
          darkreader
          dictionary-german
          duckduckgo-privacy-essentials
          indie-wiki-buddy
          return-youtube-dislikes
          simple-tab-groups
          ublock-origin
          whowrotethat
        ];
      };
    in
    {
      "${userSettings.username}" = lib.mkMerge [
        common
        {
          id = 0; # implies `isDefault = true;`
          extensions.packages = lib.optionals (
            systemSettings.de == "plasma"
          ) firefox-addons.plasma-integration;
        }
      ];
      # should ideally have been in `ferrous.nix`, but then I wouldn't be able to access `common`
      ferrous = lib.mkMerge [
        common
        {
          id = 1;
          extensions.packages = with firefox-addons; [ onepassword-password-manager ];
        }
      ];
    };
}
