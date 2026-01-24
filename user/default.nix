{ lib, systemSettings, ... }:
{
  imports = [
    ./apps
    ./dev
    ./email.nix
    ./flatpak.nix
    ./fonts.nix
    ./nix.nix
    ./nixpkgs.nix
    ./tldr.nix
    ./xdg.nix
  ]
  ++ lib.optionals (systemSettings.de == "plasma") [ ./plasma ]
  ++ lib.optionals (systemSettings.de == "cosmic") [ ./cosmic ];
}
