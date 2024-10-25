{ lib, config, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global.hide_env_diff = true;
    };
  };

  # Reference: https://github.com/nix-community/nix-direnv/wiki/Shell-integration
  programs.zsh.initExtra = lib.mkIf config.programs.direnv.enable ''
    flakify() {
        if [ ! -e flake.nix ]; then
            nix flake new -t github:ugur-a/nixos-config#nix-direnv .
        elif [ ! -e .envrc ]; then
            echo "use flake" > .envrc
            direnv allow
        fi
        ''${EDITOR:-vim} flake.nix
    }
  '';
}
