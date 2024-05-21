{pkgs, ...}: {
  home.packages = with pkgs; [
    # LSPs
    nixd
    lua-language-server
    rust-analyzer

    # Formatters
    # vimPlugins.vim-clang-format # conflicts with gruvbox-nvim & lazygit-nvim for some reason?
    clang-tools # c(++), js(on)
    alejandra
    rustfmt
    stylua
    taplo # toml

    # Misc
    # vimPlugins.lazygit-nvim
    lazygit
    bacon
  ];
}
