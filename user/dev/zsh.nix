{config, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      path = "${config.xdg.stateHome}/zsh/history";
      ignoreAllDups = true;
    };
    historySubstringSearch.enable = true;
    shellAliases = {
      cat = "bat";
      cd = "z";
      du = "dust";
      ls = "eza";
      top = "htop";
      n = "nvim";
      up = "nix flake update --commit-lock-file $FLAKE && nh home switch && nh os switch";
    };
    shellGlobalAliases = {
      L = "| less";
      G = "| rg";
    };
    antidote = {
      enable = true;
      plugins =
        # OhMyZsh
        map (x: "ohmyzsh/ohmyzsh path:plugins/${x}") ["git" "rust" "sudo" "sudo" "systemd" "zoxide"];
    };
  };
}
