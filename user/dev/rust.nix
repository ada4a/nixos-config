{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    cargo-flamegraph
    cargo-generate
    cargo-modules
    cargo-nextest
    clippy
    rustc
  ];

  home.sessionVariables.CARGO_HOME = "${config.xdg.cacheHome}/cargo";

  programs.rust.cargo = {
    enable = true;
    settings = {
      build.target-dir = "${config.home.sessionVariables.CARGO_HOME}/target";
    };
  };
}
