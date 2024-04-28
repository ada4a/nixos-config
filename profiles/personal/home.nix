{
  config,
  pkgs,
  userSettings,
  ...
}: {
  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;
    stateVersion = "23.11"; # Please read the comment before changing.
  };

  nixpkgs.config.allowUnfree = true; # nix-community/home-manager/#463

  imports = [
    (import ../../user/git.nix {inherit userSettings;})
    ../../user/hyfetch.nix
    #../../user/nixvim.nix
    #../../user/nix-direnv.nix
    ../../user/zsh.nix
  ];

  # Install Nix packages into the environment
  home.packages = with pkgs; [
    # Flatpaks
    #anki
    #ausweisapp
    #bitwarden
    #filelight
    #discord
    #flatpak
    #floorp
    #keepassxc
    #krename
    #obsidian
    #sqlitebrowser
    #telegram-desktop
    #ticktick
    #thunderbird
    #spotify
    #steam
    #tex-match
    #vlc
    #vscodium

    # CLI
    espanso-wayland

    rustc
    rustup

    #only listed here while I'm not on NixOS
    fastmod
    alejandra
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
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/flatpak/exports/share/applications"
    "${config.home.homeDirectory}/.nix-profile/bin"
    "${config.xdg.dataHome}/nvim/mason/bin"
    "/nix/var/nix/profiles/default/bin"
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
