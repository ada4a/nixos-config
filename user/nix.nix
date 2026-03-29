{ pkgs, inputs, ... }:
{
  # required for the next line to work
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    # nix is set to use xdg by the system-level config, so assume that here
    assumeXdg = true;
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
