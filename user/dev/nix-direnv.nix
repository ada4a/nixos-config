{...}: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      global.hide_env_diff = true;
    };
  };

  programs.zsh = {
    oh-my-zsh.plugins = ["direnv"];
    # Reference: https://github.com/nix-community/nix-direnv/wiki/Shell-integration
    initExtra = ''
      flakify() {
          if [ ! -e flake.nix ]; then
              nix flake new -t github:ugur-a/flake-custom#nix-direnv .
          elif [ ! -e .envrc ]; then
              echo "use flake" > .envrc
              direnv allow
          fi
          ''${EDITOR:-vim} flake.nix
      }
    '';
  };
}
