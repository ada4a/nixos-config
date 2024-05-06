{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    cargo-modules
    clippy
    rustc
  ];
}
