{ lib, systemSettings, ... }:
{
  imports = [
    ./apps
    ./dev
    ./email.nix
    ./fonts.nix
    ./nix.nix
    ./nixpkgs.nix
    ./syncthing.nix
    ./telegram.nix
    ./tldr.nix
    ./xdg.nix
  ]
  ++ lib.optionals (systemSettings.de == "plasma") [ ./plasma ]
  ++ lib.optionals (systemSettings.de == "cosmic") [ ./cosmic ];
}
