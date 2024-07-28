{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cargo
    cargo-flamegraph
    cargo-modules
    clippy
    rustc
  ];
}
