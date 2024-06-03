{
  description = "Flake of ugura";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = {
    nixpkgs,
    home-manager,
    plasma-manager,
    ...
  }: let
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
    # My custom packages, available through 'nix build', 'nix shell', etc
    packages.${systemSettings.system} = import ./pkgs {inherit pkgs;};

    # My custom modules
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    # Formatter for my nix files, available through 'nix fmt'
    formatter.${systemSettings.system} = pkgs.alejandra;

    # devShell for bootstrapping a configuration
    devShells.${systemSettings.system} = import ./shell.nix {inherit pkgs;};

    nixosConfigurations.${systemSettings.hostname} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;

      modules = [./profiles/personal/configuration.nix];

      specialArgs = {
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
        inherit systemSettings;
        inherit userSettings;
      };
    };
  };
}
