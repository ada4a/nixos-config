{
  # just enabling the package isn't enough
  # https://search.nixos.org/packages?channel=unstable&show=steam&type=packages
  # https://github.com/NixOS/nixpkgs/issues/221698#issuecomment-1474297925
  programs.steam.enable = true;
}
