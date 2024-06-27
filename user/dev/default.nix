{pkgs, ...}: {
  imports = [
    ./editors
    ./nix-direnv.nix
    ./rust.nix
    ./git.nix
    ./wezterm
    # disable for now because of a bug
    # reference: https://github.com/zellij-org/zellij/issues/2925
    # ./zellij
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    gdbgui
    lazygit
    bacon
  ];
}
