{
  lib,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # add words to the personal dictionary
  xdg.configFile."nvim/spell/en.utf-8.add" = {
    enable = config.programs.neovim.enable;
    text = ''
      Mergiraf
      Mergiraf's
      Jujutsu
    '';
  };

  programs.zsh.shellAliases = lib.mkIf config.programs.neovim.enable {
    "NVIM_APPNAME" = "lazyvim";
  };

}
