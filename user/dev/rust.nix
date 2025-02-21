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

  home.sessionVariables = rec {
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
    CARGO_TARGET_DIR = "${CARGO_HOME}/target";
  };
}
