{ ... }:
{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
      nix-direnv.enable = true;
  };

  programs.zsh.oh-my-zsh.plugins = ["direnv"];
}
