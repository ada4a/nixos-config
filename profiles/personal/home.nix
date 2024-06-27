{
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

  imports = [
    ../../user
  ];

  # Install Nix packages into the environment
  home.packages = with pkgs; [
    # Social
    discord
    signal-desktop
    telegram-desktop

    # Study
    anki
    obsidian

    ausweisapp
    bitwarden
    filelight
    #floorp
    kdePackages.korganizer
    krename
    ticktick
    spotify
    steam

    # CLI

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
    BROWSER = "firefox";
    FLAKE = "$HOME/.dotfiles";
  };

  home.keyboard = {
    layout = "eu,ru";
  };

  home.preferXdgDirectories = true;

  xdg.mimeApps.defaultApplications = {
    "text/*" = ["nvim.desktop"];
    "application/pdf" = ["okular.desktop"];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
