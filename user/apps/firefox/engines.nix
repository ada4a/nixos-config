{
  pkgs,
  userSettings,
  ...
}: {
  programs.firefox.profiles.${userSettings.username}.search.engines = {
    "Bing".metaData.hidden = true;
    "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
    "Wikipedia (en)".metaData.alias = "@w";

    "Docs.rs" = {
      urls = [{template = "https://docs.rs/releases/search?query={searchTerms}";}];
      icon = "https://docs.rs/-/static/favicon.ico";
      definedAliases = ["@rs"];
    };

    # Stolen from
    # https://gitlab.com/kira-bruneau/nixos-config/-/blob/5d6ae0f48c4a4df901e2b4fc0f00ffb52d6f01c2/home/programs/firefox/default.nix#L28-45
    "Github" = {
      urls = [{template = "https://github.com/search?q={searchTerms}&ref=opensearch";}];
      icon = "${pkgs.fetchurl {
        url = "https://github.githubassets.com/favicons/favicon.svg";
        hash = "sha256-apV3zU9/prdb3hAlr4W5ROndE4g3O1XMum6fgKwurmA=";
      }}";
      definedAliases = ["@gh"];
    };

    "NixOS Wiki" = {
      urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
      iconUpdateURL = "https://wiki.nixos.org/favicon.png";
      updateInterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = ["@nxw"];
    };

    "NixOS options" = {
      urls = [{template = "https://search.nixos.org/options?query={searchTerms}";}];
      icon = "/favicon.png";
      definedAliases = ["@nxo"];
    };

    "NixOS packages" = {
      urls = [{template = "https://search.nixos.org/packages?query={searchTerms}";}];
      icon = "/favicon.png";
      definedAliases = ["@nxp"];
    };

    # Stolen from
    # https://gitlab.com/kira-bruneau/nixos-config/-/blob/5d6ae0f48c4a4df901e2b4fc0f00ffb52d6f01c2/home/programs/firefox/default.nix#L83-96
    "Nixpkgs Issues" = {
      urls = [{template = "https://github.com/NixOS/nixpkgs/issues?q=is:issue+is:open+{searchTerms}";}];
      icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      definedAliases = ["@nxi"];
    };

    # Stolen from:
    # https://github.com/hpfr/system/blob/a108a5ebf3ffcee75565176243936de6fd736142/profiles/user/firefox/default.nix#L148-L156
    "WayBack Machine" = {
      urls = [{template = "https://web.archive.org/web/*/{searchTerms}";}];
      iconUpdateURL = "https://web.archive.org/_static/images/archive.ico";
      updateInterval = 24 * 60 * 60 * 1000;
      definedAliases = ["@wba"];
    };

    # Stolen from
    # https://gitlab.com/kira-bruneau/nixos-config/-/blob/5d6ae0f48c4a4df901e2b4fc0f00ffb52d6f01c2/home/programs/firefox/default.nix#L119-138
    "Youtube" = {
      urls = [{template = "https://www.youtube.com/results?search_query={searchTerms}";}];
      icon = "${pkgs.fetchurl {
        url = "www.youtube.com/s/desktop/8498231a/img/favicon_144x144.png";
        sha256 = "sha256-lQ5gbLyoWCH7cgoYcy+WlFDjHGbxwB8Xz0G7AZnr9vI=";
      }}";
      definedAliases = ["@y"];
    };
  };
}
