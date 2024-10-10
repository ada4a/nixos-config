{ lib, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.shellAliases = lib.mkIf config.programs.neovim.enable {
    "NVIM_APPNAME" = "lazyvim";
  };

}
