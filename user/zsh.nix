{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      cat = "bat";
      cd = "z";
      du = "dust";
      ls = "eza";
      top = "htop";
      n = "nvim";
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
