{config, ...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    history = {
      path = "${config.xdg.stateHome}/zsh/history";
      ignoreAllDups = true;
    };
    shellAliases = {
      cat = "bat";
      cd = "z";
      du = "dust";
      ls = "eza";
      top = "htop";
      n = "nvim";
      up = "nix flake update --commit-lock-file $FLAKE && nh home switch && nh os switch";
      v = "nvim";
      vi = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "rust"
        "sudo"
        "systemd"
        "zoxide"
      ];
    };
  };
}
