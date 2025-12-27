{ pkgs, inputs, ... }:
{
  # required for the next line to work
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    # also set this here, since home-manager doesn't see the system config
    # and doesn't move .nix-profile etc.
    settings.use-xdg-base-directories = true;
    gc.options = "--delete-generations 7d";
    registry = {
      # shortcut: `nix run n#foo` instead of `nix run nixpkgs#foo`
      n = {
        from = {
          id = "n";
          type = "indirect";
        };
        flake = inputs.nixpkgs;
      };
    };
  };
}
