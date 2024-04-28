{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
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
      up = "sudo zypper dup && flatpak update && cargo install-update";
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
