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
        map (x: "ohmyzsh/ohmyzsh path:plugins/${x}") ["git" "rust" "sudo" "sudo" "systemd" "zoxide"]
        ++ ["Aloxaf/fzf-tab"];
    };
    initExtra = ''
      # Completion styling
      # Stolen from: https://github.com/dreamsofautonomy/zensh/blob/0ef5b9384f22923c73ae521d5d74bebb7b5791f5/.zshrc#L70-L75
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "$${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    '';
  };
}
