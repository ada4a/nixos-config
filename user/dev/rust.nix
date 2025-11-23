{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    clang # rustc requires a C compiler

    cargo-flamegraph
    cargo-info
    cargo-nextest
    rustup
    rusty-man
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
  };

  programs.zsh.shellAliases = lib.mkIf config.programs.neovim.enable {
    "c" = "cargo";
    "cuit" = "cargo uitest";
    "cuib" = "cargo uibless";
    "nvimr" = "NVIM_APPNAME=nvim-rustc nvim";
    "nr" = "NVIM_APPNAME=nvim-rustc nvim";
  };
}
