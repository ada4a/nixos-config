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
      _latex.matches = [
        # My additions
        {
          trigger = ";ba";
          replace = "\\bar{}";
        }
        {
          trigger = ";su";
          replace = "\\sum_{$|$}^{}";
        }
        {
          trigger = ";pr";
          replace = "\\prod_{$|$}^{}";
        }
        {
          trigger = ";fr";
          replace = "\\frac{$|$}{}";
        }
        {
          trigger = ";def";
          replace = "\\coloneqq";
        }
        {
          trigger = ";rm";
          replace = "\\mathrm{}";
        }
        {
          trigger = ";pu";
          replace = "\\pu{}";
        }
        # Default
        {
          trigger = ";bi";
          replace = "\\binom{$|$}{}";
        }
        {
          trigger = ";sq";
          replace = "\\sqrt{}";
        }
        {
          trigger = ";bb";
          replace = "\\mathbb{}";
        }
        {
          trigger = ";bf";
          replace = "\\mathbf{}";
        }
        {
          trigger = ";te";
          replace = "\\text{}";
        }
        {
          trigger = ";inf";
          replace = "\\infty";
        }
        {
          trigger = ";cd";
          replace = "\\cdot";
        }
        {
          trigger = ";qu";
          replace = "\\quad";
        }
        {
          trigger = ";ti";
          replace = "\\times";
        }
        {
          trigger = ";al";
          replace = "\\alpha";
        }
        {
          trigger = ";be";
          replace = "\\beta";
        }
        {
          trigger = ";ga";
          replace = "\\gamma";
        }
        {
          trigger = ";Ga";
          replace = "\\Gamma";
        }
        {
          trigger = ";de";
          replace = "\\delta";
        }
        {
          trigger = ";De";
          replace = "\\Delta";
        }
        {
          trigger = ";ep";
          replace = "\\epsilon";
        }
        {
          trigger = ";ze";
          replace = "\\zeta";
        }
        {
          trigger = ";et";
          replace = "\\eta";
        }
        {
          trigger = ";th";
          replace = "\\theta";
        }
        {
          trigger = ";Th";
          replace = "\\Theta";
        }
        {
          trigger = ";io";
          replace = "\\iota";
        }
        {
          trigger = ";ka";
          replace = "\\kappa";
        }
        {
          trigger = ";la";
          replace = "\\lambda";
        }
        {
          trigger = ";La";
          replace = "\\Lambda";
        }
        {
          trigger = ";mu";
          replace = "\\mu";
        }
        {
          trigger = ";nu";
          replace = "\\nu";
        }
        {
          trigger = ";xi";
          replace = "\\xi";
        }
        {
          trigger = ";Xi";
          replace = "\\Xi";
        }
        {
          trigger = ";pi";
          replace = "\\pi";
        }
        {
          trigger = ";Pi";
          replace = "\\Pi";
        }
        {
          trigger = ";rh";
          replace = "\\rho";
        }
        {
          trigger = ";si";
          replace = "\\sigma";
        }
        {
          trigger = ";Si";
          replace = "\\Sigma";
        }
        {
          trigger = ";ta";
          replace = "\\tau";
        }
        {
          trigger = ";up";
          replace = "\\upsilon";
        }
        {
          trigger = ";Up";
          replace = "\\Upsilon";
        }
        {
          trigger = ";ph";
          replace = "\\phi";
        }
        {
          trigger = ";Ph";
          replace = "\\Phi";
        }
        {
          trigger = ";ch";
          replace = "\\chi";
        }
        {
          trigger = ";ps";
          replace = "\\psi";
        }
        {
          trigger = ";Ps";
          replace = "\\Psi";
        }
        {
          trigger = ";om";
          replace = "\\omega";
        }
        {
          trigger = ";Om";
          replace = "\\Omega";
        }
      ];
    };
  };
}
