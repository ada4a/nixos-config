{ lib, config, ... }:
{
  programs.fish.shellAbbrs = lib.mkIf config.programs.plasma.enable {
    rc2nix = "nix run github:nix-community/plasma-manager";
  };
}
