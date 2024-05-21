{...}: {
  # extract the config into a separate file, so that it can be sourced both by..
  # Home-Manager..
  nixpkgs.config = import ./config.nix;
  # and nix-{env,shell,etc.}
  xdg.configFile."nixpkgs/config.nix".source = ./config.nix;
}
