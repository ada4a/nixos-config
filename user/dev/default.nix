{pkgs, ...}: {
  imports = [
    ./editors
    ./nix-direnv.nix
    ./rust.nix
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
