{userSettings, ...}: let
  updateInterval = 24 * 60 * 60 * 1000 * 7; # every week
in {
  programs.firefox.profiles.${userSettings.username}.search.engines = {
    "Bing".metaData.hidden = true;
    "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
    "Wikipedia (en)".metaData.alias = "@w";

    "Docs.rs" = {
      urls = [{template = "https://docs.rs/releases/search?query={searchTerms}";}];
      iconUpdateURL = "https://docs.rs/-/static/favicon.ico";
      inherit updateInterval;
      definedAliases = ["@rs"];
    };

    "Rust Standard Library" = {
      urls = [{template = "https://doc.rust-lang.org/std/?search={searchTerms}";}];
      iconUpdateURL = "https://docs.rs/-/static/favicon.ico";
      inherit updateInterval;
      definedAliases = ["@rstd"];
    };

    "Github" = {
      urls = [{template = "https://github.com/search?q={searchTerms}&ref=opensearch";}];
      iconUpdateURL = "https://github.githubassets.com/favicons/favicon.svg";
      inherit updateInterval;
      definedAliases = ["@gh"];
    };

    "NixOS Wiki" = {
      urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
      iconUpdateURL = "https://wiki.nixos.org/favicon.png";
      inherit updateInterval;
      definedAliases = ["@nxw"];
    };

    "NixOS options" = {
      urls = [{template = "https://search.nixos.org/options?query={searchTerms}";}];
      iconUpdateURL = "https://search.nixos.org/favicon.png";
      inherit updateInterval;
      definedAliases = ["@nxo"];
    };

    "NixOS packages" = {
      urls = [{template = "https://search.nixos.org/packages?query={searchTerms}";}];
      iconUpdateURL = "https://search.nixos.org/favicon.png";
      inherit updateInterval;
      definedAliases = ["@nxp"];
    };

    "Nixpkgs Issues" = {
      urls = [{template = "https://github.com/NixOS/nixpkgs/issues?q=is:issue+is:open+{searchTerms}";}];
      iconUpdateURL = "https://search.nixos.org/favicon.png";
      inherit updateInterval;
      definedAliases = ["@nxi"];
    };

    "Home Manager - Options Search" = {
      urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}";}];
      iconUpdateURL = "https://home-manager-options.extranix.com/images/favicon.png";
      inherit updateInterval;
      definedAliases = ["@hm"];
    };

    "Leo Eng-Ger" = {
      urls = [
        {template = "https://dict.leo.org/german-english/{searchTerms}";}
        {template = "https://dict.leo.org/dictQuery/m-query/conf/ende/query.conf/strlist.json?q={searchTerms}&sort=PLa&shortQuery&noDescription&noQueryURLs";}
      ];
      iconUpdateURL = "https://dict.leo.org/img/favicons/ende.ico";
      inherit updateInterval;
      definedAliases = ["@leo"];
    };

    "Leo Rus-Deu" = {
      urls = [
        {template = "https://dict.leo.org/немецкий-русский/{searchTerms}";}
        {template = "https://dict.leo.org/dictQuery/m-query/conf/rude/query.conf/strlist.json?q={searchTerms}&sort=PLa&shortQuery&noDescription&noQueryURLs";}
      ];
      iconUpdateURL = "https://dict.leo.org/img/favicons/rude.ico";
      inherit updateInterval;
      definedAliases = ["@leor"];
    };

    "WayBack Machine" = {
      urls = [{template = "https://web.archive.org/web/*/{searchTerms}";}];
      iconUpdateURL = "https://web.archive.org/_static/images/archive.ico";
      inherit updateInterval;
      definedAliases = ["@wba"];
    };

    "Youtube" = {
      urls = [{template = "https://www.youtube.com/results?search_query={searchTerms}";}];
      iconUpdateURL = "www.youtube.com/s/desktop/8498231a/img/favicon_144x144.png";
      inherit updateInterval;
      definedAliases = ["@y"];
    };
  };
}
