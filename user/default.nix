{ lib, systemSettings, ... }:
{
  imports = [
    ./apps
    ./dev
    ./email.nix
    ./fonts.nix
    ./nix.nix
    ./nixpkgs.nix
    ./telegram.nix
    ./xdg.nix
  ]
  ++ lib.optionals (systemSettings.de == "plasma") [ ./plasma ]
  ++ lib.optionals (systemSettings.de == "cosmic") [ ./cosmic.nix ];
}
