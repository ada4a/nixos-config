{...}: {
  imports = [
    ./bluetooth.nix
    ./certificates
    #./flatpak.nix
    ./hardware-configuration.nix
    ./nix.nix
    ./plasma.nix
    ./power.nix
    ./steam.nix
    ./syncthing.nix
  ];
}
