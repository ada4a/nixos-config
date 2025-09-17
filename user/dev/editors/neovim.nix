{
  pkgs,
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

  home.packages = lib.optionals cfg.enable [
    pkgs.tree-sitter # required for nvim-lspconfig, https://github.com/LazyVim/LazyVim/commit/5eac460c092103e5516bec345236853b9f35ec7c
  ];

}
