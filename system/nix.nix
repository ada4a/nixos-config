{ pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.nixVersions.stable;
    # Opinionated: disable channels^[1]
    channel.enable = false;
    # allows accessing unfree packages in `nix run` and friends
    # Example: `nix shell nixpkgs-unfree#gurobi`
    # https://discourse.nixos.org/t/permanently-enabling-unfree-packages-for-nix-profile-system-config-uses-flake/44394/2
    registry."nixpkgs-unfree" = {
      from = {
        id = "nixpkgs-unfree";
        type = "indirect";
      };
      flake = inputs.nixpkgs-unfree;
    };
  };

  nix.settings = {
    auto-optimise-store = true;
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Opinionated: disable global registry^[1]
    flake-registry = "";
    use-xdg-base-directories = true;
  };
}
# [1]: https://github.com/Misterio77/nix-starter-configs/blob/main/standard/nixos/configuration.nix#L52
