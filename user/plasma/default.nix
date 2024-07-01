{...}: {
  imports = [(f: import ./rc2nix-ed.nix)];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
}
