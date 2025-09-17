{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.neovim;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # add words to the personal dictionary
  xdg.configFile."nvim/spell/en.utf-8.add" = {
    enable = cfg.enable;
    text = ''
      Mergiraf
      Mergiraf's
      Jujutsu
    '';
  };

  programs.zsh.shellAliases = lib.mkIf cfg.enable {
    "NVIM_APPNAME" = "lazyvim";
  };

}
