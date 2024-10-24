{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.javascript
        p.lua
        p.markdown
        p.nix
        p.rust
      ]))
    ];
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.shellAliases = lib.mkIf config.programs.neovim.enable {
    "NVIM_APPNAME" = "lazyvim";
  };

}
