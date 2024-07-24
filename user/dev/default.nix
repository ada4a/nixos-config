{pkgs, ...}: {
  imports = [
    ./editors
    ./nix-direnv.nix
    ./rust.nix
    ./oh-my-posh.nix
    ./git.nix
    ./wezterm.nix
    ./zellij
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gdbgui
    lazygit
    bacon
  ];
}
