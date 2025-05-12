{ config, ... }:
{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = false;
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
      up = "nix flake update --commit-lock-file --flake $FLAKE && nh home switch && nh os switch";
    };
    shellGlobalAliases = {
      L = "| less";
      G = "| rg";
    };

    antidote = {
      enable = true;
      plugins =
        # OhMyZsh
        map (x: "ohmyzsh/ohmyzsh path:plugins/${x}") [
          "git"
          "rust"
          "sudo"
          "systemd"
        ]
        ++ [ "Aloxaf/fzf-tab" ];
    };

    initContent = ''
      # Completion styling
      # Stolen from: https://github.com/dreamsofautonomy/zensh/blob/0ef5b9384f22923c73ae521d5d74bebb7b5791f5/.zshrc#L70-L75
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "$${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      # Search history by prefix
      # Stolen from: ditto
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
    '';
  };
}
