# Reference: https://linuxhint.com/how-to-instal-steam-on-nixos/
{}: {
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    steam-run-native
  ];
}
