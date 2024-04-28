{
  description = "Flake of ugura";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    ...
  }: let
    systemSettings = {
      system = "x86_64-linux";
      bootMountPath = "/boot";
      hostname = "magicbook";
      timezone = "Europe/Berlin";
      locale = "en_IE.UTF-8";
      stateVersion = "24.05";
    };

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};

    userSettings = {
      email = "ugur.alekperov@gmail.com";
      name = "Ughur Alakbarov";
      username = "ugura";
      layout = "eu";
    };
  in {
    nixosConfigurations = {
      system = systemSettings.system;

      modules = [.profiles/personal/configuration.nix];

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
        nixvim.homeManagerModules.nixvim
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
