{ pkgs, ... }:
{
  # required for the next line to work
  nix.package = pkgs.nixFlakes;
  # also set this here, since home-manager doesn't see the system config
  # and doesn't move .nix-profile etc.
  nix.settings.use-xdg-base-directories = true;
  nix.gc.options = "--delete-generations 7d";
}
