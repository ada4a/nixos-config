{userSettings, ...}: {
  imports = [
    ./nix-direnv.nix
    ./rust.nix
    ./neovim.nix
    (import ./git.nix {inherit userSettings;})
    ./zsh.nix
  ];
}
