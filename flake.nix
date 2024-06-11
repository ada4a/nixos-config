{
  description = "Flake of ugura";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Secure Boot
    lanzaboote.url = "github:nix-community/lanzaboote/v0.3.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    # Third party programs, packaged with nix
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    # My custom stuff
    ugura-custom.url = "./custom";
    ugura-custom.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    plasma-manager,
    lanzaboote,
    firefox-addons,
    ugura-custom,
    ...
  } @ inputs: let
    systemSettings = {
      system = "x86_64-linux";
      bootMountPath = "/boot";
      hostname = "magicbook";
      timezone = "Europe/Berlin";
      locale = "en_IE.UTF-8";
      stateVersion = "23.11";
    };

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};

    userSettings = {
      gmail = "ugur.alekperov@gmail.com";
      rmail = "ughur.alakbarov@rwth-aachen.de";
      pmail = "ugur.alekperov@protonmail.com";
      name = "Ughur Alakbarov";
      username = "ugura";
      layout = "eu";
      shell = pkgs.zsh;
    };
  in {
    # Formatter for my nix files, available through 'nix fmt'
    formatter.${systemSettings.system} = pkgs.alejandra;

    # devShell for bootstrapping a configuration
    devShells.${systemSettings.system} = import ./shell.nix {inherit pkgs;};

    nixosConfigurations.${systemSettings.hostname} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;

      modules = [
        ./profiles/personal/configuration.nix
        lanzaboote.nixosModules.lanzaboote
      ];

      specialArgs = {
        inherit ugura-custom;
        inherit systemSettings;
        inherit userSettings;
      };
    };

    homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./profiles/personal/home.nix
        plasma-manager.homeManagerModules.plasma-manager
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {
        inherit ugura-custom;
        inherit systemSettings;
        inherit userSettings;
      };
    };
  };
}
