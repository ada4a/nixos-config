{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    cargo-flamegraph
    cargo-generate
    cargo-modules
    clippy
    rustc
  ];
}
