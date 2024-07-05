{
  pkgs,
  userSettings,
  ...
}: {
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        auto_restart = true;
        toggle_key = "ALT";
        keyboard_layout.layout = "${userSettings.layout}";
      };
      thunderbird = {
        filter-class = "thunderbird";
        backend = "Inject";
      };
      obsidian = {
        filter-class = "obsidian";
        extra_includes = ["../match/_latex.yml"];
      };
    };
    matches = {
      emails.matches = [
        {
          trigger = ";gmail";
          replace = userSettings.gmail;
        }
        {
          trigger = ";pmail";
          replace = userSettings.pmail;
        }
        {
          trigger = ";rmail";
          replace = userSettings.rmail;
        }
      ];
      webarchive.matches = [
        {
          trigger = ";archive";
          replace = "https://web.archive.org/web/";
        }
      ];
    };
  };
}
