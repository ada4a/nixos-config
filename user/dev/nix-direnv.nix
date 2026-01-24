{ lib, config, ... }:
let
  cfg = config.programs.direnv;
in
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        hide_env_diff = true;
        # stop the "`direnv export $SHELL` is taking a while" warning
        # https://github.com/direnv/direnv/blob/978008aa7c66e5beb3e3c4a7705c3d0ce4f99f1c/man/direnv.toml.1.md?plain=1#L56
        warn_timeout = "0s";
      };
    };
  };

  programs.git.ignores = lib.optionals cfg.enable [ ".direnv" ];

  # Rewritten into fish from https://github.com/nix-community/nix-direnv/wiki/Shell-integration
  programs.fish.functions = lib.mkIf cfg.enable {
    flakify = /* fish */ ''
      if not path is flake.nix
          nix flake new -t github:ada4a/nixos-config#nix-direnv .
      else if not path is .envrc
          echo "use flake" > .envrc
          direnv allow
      end
      ''${EDITOR:-vim} flake.nix
    '';
  };
}
