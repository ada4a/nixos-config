{...}: {
  imports = [(f: import ./rc2nix-ed.nix)];
  programs.plasma.overrideConfig = true;
}
