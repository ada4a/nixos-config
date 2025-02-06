{
  description = "Flake of ada4a";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unfree.url = "github:numtide/nixpkgs-unfree/nixos-unstable";
    nixpkgs-unfree.inputs.nixpkgs.follows = "nixpkgs";
    # only add this so that all the other inputs follow it
    flake-utils.url = "github:numtide/flake-utils";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Extra modules for home-manager
    xhmm.url = "github:schuelermine/xhmm";

    # Third party programs, packaged with nix
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons.inputs.flake-utils.follows = "flake-utils";

    # Secure Boot
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.1";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.inputs.flake-utils.follows = "flake-utils";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    mergiraf.url = "git+https://codeberg.org/mergiraf/mergiraf";
    mergiraf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      lanzaboote,
      nixos-cosmic,
      plasma-manager,
      xhmm,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      systemSettings = {
        system = "x86_64-linux";
        bootMountPath = "/boot";
        hostname = "magicbook";
        timezone = "Europe/Berlin";
        locale = "en_IE.UTF-8";
        de = "plasma";
        stateVersion = "23.11";
      };

      pkgs = import nixpkgs {
        inherit (systemSettings) system;
        overlays = builtins.attrValues outputs.overlays;
      };

      userSettings = {
        rmail = "ughur.alakbarov@rwth-aachen.de";
        pmail = "ada.alakbarova@proton.me";
        name = "Ada Alakbarova";
        username = "ada4a";
        layout = "eu";
        shell = pkgs.zsh;
        # I'd use WezTerm, but the patch invalidates the NixOS cache and triggers a manual build.
        # The latter takes AGES on this machine (and also fails right at the end it seems?)
        # So stay on Konsole for now
        terminal = "konsole";
        fonts.mono = "Cascadia Code";
      };
    in
    {
      overlays = import ./overlays { inherit inputs; };

      templates = import ./templates;
    }
    # My actual config
    // {
      # Formatter for my nix files, available through 'nix fmt'
      formatter.${systemSettings.system} = pkgs.nixfmt-rfc-style;

      # devShell for bootstrapping a configuration
      devShells.${systemSettings.system} = import ./shell.nix { inherit pkgs; };

      nixosConfigurations.${systemSettings.hostname} = nixpkgs.lib.nixosSystem {
        inherit (systemSettings) system;

        modules = [
          ./profiles/personal/configuration.nix
          nixos-cosmic.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
        ];

        specialArgs = {
          inherit
            inputs
            outputs
            systemSettings
            userSettings
            ;
        };
      };

      homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./profiles/personal/home.nix
          plasma-manager.homeManagerModules.plasma-manager
          xhmm.homeManagerModules.all
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit
            inputs
            outputs
            systemSettings
            userSettings
            ;
        };
      };
    };
}
