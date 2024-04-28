{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  home = {
    inherit (userSettings) username;
    homeDirectory = "/home/" + userSettings.username;
    inherit (systemSettings) stateVersion; # Please read the comment before changing.
  };

  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-generations 7d";
    };
  };

  nixpkgs.config.allowUnfree = true; # nix-community/home-manager/#463

  imports = [
    (import ../../user/git.nix {inherit userSettings;})
    ../../user/espanso.nix
    ../../user/hyfetch.nix
    ../../user/neovim
    #../../user/nix-direnv.nix
    ../../user/zsh.nix
  ];

  # Install Nix packages into the environment
  home.packages = with pkgs; [
    # Flatpaks
    anki
    ausweisapp
    bitwarden
    filelight
    discord
    flatpak
    floorp
    keepassxc
    krename
    obsidian
    sqlitebrowser
    telegram-desktop
    ticktick
    thunderbird
    spotify
    tex-match
    vlc
    vscodium

    # CLI
    espanso-wayland

    cargo
    clippy
    rustc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Manage plain dotfile files
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Manage environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/flatpak/exports/share/applications"
    "${config.xdg.dataHome}/nvim/mason/bin"
  ];

  home.keyboard = {
    layout = "eu,ru";
  };

  xdg.mimeApps.defaultApplications = {
    #"text/*" = ["nixvim.desktop"];
    "application/pdf" = ["okular.desktop"];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
