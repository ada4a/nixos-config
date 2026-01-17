{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    clang # rustc requires a C compiler

    cargo-expand
    cargo-flamegraph
    cargo-info
    cargo-nextest
    rustup
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
  };

  programs.fish.shellAbbrs = lib.mkMerge [
    {
      c = "cargo";
      cuit = "cargo uitest";
      cuib = "cargo uibless";
    }
    (lib.mkIf config.programs.neovim.enable {
      nvimr = "NVIM_APPNAME=nvim-rustc nvim";
      nr = "NVIM_APPNAME=nvim-rustc nvim";
    })
  ];
}
