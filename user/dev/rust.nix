{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    cargo-flamegraph
    cargo-nextest
    cargo
    clippy
    rustc
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
  };
}
