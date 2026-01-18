{ pkgs, ... }:
{
  imports = [
    ./editors

    ./fish.nix
    ./git.nix
    ./jujutsu.nix
    ./lazygit.nix
    ./mergiraf
    ./mprocs.nix
    ./nix-direnv.nix
    ./oh-my-posh.nix
    ./rust.nix
    ./ssh.nix
    ./wezterm.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    bacon
  ];

}
