{
  imports = [
    ./bluetooth.nix
    ./certificates
    #./flatpak.nix
    ./hardware-configuration.nix
    ./maintenance.nix
    ./nix.nix
    ./desktop_environments
    ./power.nix
    ./steam.nix
    ./syncthing.nix
    ./wayland.nix
  ];
}
