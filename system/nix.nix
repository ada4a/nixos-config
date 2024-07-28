{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    # Opinionated: disable channels^[1]
    channel.enable = false;
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    # Opinionated: disable global registry^[1]
    flake-registry = "";
  };
}
# [1]: https://github.com/Misterio77/nix-starter-configs/blob/main/standard/nixos/configuration.nix#L52
