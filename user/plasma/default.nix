{
  lib,
  config,
  systemSettings,
  ...
}:
let
  cfg = config.programs.plasma;
in
{
  imports = [
    ./rc2nix.nix

    ./input.nix
    ./konsole.nix
    ./night-light.nix
    ./panels.nix
    ./shortcuts.nix
    ./window-rules.nix
  ];

  programs.plasma = {
    # there's no way to configure Cosmic on user-level (=home-manager) (yet?)
    enable = (systemSettings.de == "plasma");

    configFile = {
      # disable the hot corner (aka. Screen Edge)
      "kwinrc"."Effect-overview"."BorderActivate" = 9;
      "kxkbrc"."Layout"."ResetOldOptions" = true;
      "kxkbrc"."Layout"."Options" = "grp:win_space_toggle,caps:escape_shifted_capslock";
      # https://discuss.kde.org/t/6-1-plasma-mouse-sticking-a-bit-more-to-screen-edges/17437/
      "kwinrc"."EdgeBarrier"."EdgeBarrier" = 10;
      # disable the reminder for Plasma Integration
      "plasmanotifyrc"."Applications/firefox"."Seen" = true;
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
    };

    workspace = {
      clickItemTo = "select";
      wallpaper = ../wallpaper.jpg;
    };
  };

  xdg.configFile = lib.mkIf cfg.enable {
    "PlasmaUserFeedback".text = lib.generators.toINI { } { Global.FeedbackLevel = 64; };
  };

  systemd.user = lib.mkIf cfg.enable {
    services = {
      light-theme = {
        Unit = {
          Description = "Enable light theme";
          After = "graphical.target";
        };

        Service = {
          ExecStart = "/run/current-system/sw/bin/plasma-apply-colorscheme BreezeLight";
        };
      };

      dark-theme = {
        Unit = {
          Description = "Enable dark theme";
          After = "graphical.target";
        };

        Service = {
          ExecStart = "/run/current-system/sw/bin/plasma-apply-colorscheme BreezeDark";
        };
      };

    };

    timers = {
      light-theme = {
        Timer = {
          OnCalendar = "07:00";
          Persistent = true;
        };

        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
      dark-theme = {
        Timer = {
          OnCalendar = "21:00";
          Persistent = true;
        };

        Install = {
          WantedBy = [ "timers.target" ];
        };
      };

    };
  };
}
