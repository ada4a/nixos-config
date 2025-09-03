{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    clang # rustc requires a C compiler

    cargo-flamegraph
    cargo-info
    cargo-nextest
    cargo
    clippy
    rustc
    rusty-man
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
  };
}
