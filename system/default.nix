{
  imports = [
    ./bluetooth.nix
    ./certificates
    ./embedded-training.nix
    #./flatpak.nix
    ./hardware-configuration.nix
    ./maintenance.nix
    ./memreserver.nix
    ./nix.nix
    ./desktop_environments
    ./power.nix
    ./steam.nix
    ./wayland.nix
  ];
}
