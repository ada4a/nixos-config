{
  userSettings,
  pkgs,
  ...
}: {
  imports = [
    ./nix-direnv.nix
    ./rust.nix
    ./neovim.nix
    (import ./git.nix {inherit userSettings;})
    # disable for now because of a bug
    # reference: https://github.com/zellij-org/zellij/issues/2925
    #./zellij.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [lldb];
}
