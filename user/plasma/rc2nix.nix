{
  lib,
  config,
  ...
}: {
  programs.zsh.shellAliases = lib.mkIf config.programs.plasma.enable {
    "rc2nix" = "nix run github:nix-community/plasma-manager";
  };
}
