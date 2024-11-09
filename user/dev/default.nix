{ pkgs, ... }:
{
  imports = [
    ./editors

    ./git.nix
    ./lazygit.nix
    ./mergiraf.nix
    ./nix-direnv.nix
    ./oh-my-posh.nix
    ./rust.nix
    ./wezterm.nix
    ./zellij
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gdbgui
    bacon
  ];
}
