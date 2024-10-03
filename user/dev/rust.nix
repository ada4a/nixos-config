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
      profile.release.debug = true;
      lints.clippy = {
        pedantic = {
          level = "warn";
          priority = -1;
        };
        cast_sign_loss = "allow";
        cast_possible_truncation = "allow";
        cast_possible_wrap = "allow";
        missing_panics_doc = "allow";
        missing_errors_doc = "allow";
        must_use_candidate = "allow";
      };
    };
  };
}
