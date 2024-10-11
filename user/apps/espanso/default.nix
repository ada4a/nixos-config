{ pkgs, userSettings, ... }:
{
  services.espanso = {
    enable = false; # currently broken
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
    };
  };
}
