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
    # FIXME: remove these two after updating `home.stateVersion` to 26.05+
    withPython3 = false;
    withRuby = false;
    # The two options above make home-manager write into `init.lua`,
    # so use `initLua` to combine that with the contents we have (lazyvim bootstrap)
    initLua = lib.mkAfter ''
      -- bootstrap lazy.nvim, LazyVim and your plugins
      require("config.lazy")
    '';
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

  home.packages = lib.optionals cfg.enable [
    pkgs.tree-sitter # required for nvim-lspconfig, https://github.com/LazyVim/LazyVim/commit/5eac460c092103e5516bec345236853b9f35ec7c
  ];

}
