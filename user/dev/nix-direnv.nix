{ lib, config, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        hide_env_diff = true;
        # stop the "`direnv export zsh` is taking a while" warning
        # https://github.com/direnv/direnv/blob/978008aa7c66e5beb3e3c4a7705c3d0ce4f99f1c/man/direnv.toml.1.md?plain=1#L56
        warn_timeout = "0s";
      };
    };
    # put all `.direnv`s in one location
    # https://github.com/direnv/direnv/wiki/Customizing-cache-location#human-readable-directories
    stdlib = ''
      : "''${XDG_CACHE_HOME:="''${HOME}/.cache"}"
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
          local hash path
          echo "''${direnv_layout_dirs[$PWD]:=$(
              hash="$(sha1sum - <<< "$PWD" | head -c40)"
              path="''${PWD//[^a-zA-Z0-9]/-}"
              echo "''${XDG_CACHE_HOME}/direnv/layouts/''${hash}''${path}"
          )}"
      }
    '';
  };

  # Reference: https://github.com/nix-community/nix-direnv/wiki/Shell-integration
  programs.zsh.initExtra = lib.mkIf config.programs.direnv.enable ''
    flakify() {
        if [ ! -e flake.nix ]; then
            nix flake new -t github:ada4a/nixos-config#nix-direnv .
        elif [ ! -e .envrc ]; then
            echo "use flake" > .envrc
            direnv allow
        fi
        ''${EDITOR:-vim} flake.nix
    }
  '';
}
