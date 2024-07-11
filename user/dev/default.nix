{pkgs, ...}: {
  imports = [
    ./editors
    ./nix-direnv.nix
    ./rust.nix
    ./git.nix
    ./wezterm
    ./zellij
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gdbgui
    lazygit
    bacon
  ];
}
