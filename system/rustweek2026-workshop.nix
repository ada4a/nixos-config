# Everything required for https://2026.rustweek.org/workshops/hard-problems/
{ pkgs, ... }:
{
  environment.systemPackages =
    with pkgs;

    # All talks: a working Rust toolchain.
    [ rustup ]

    # eBPF: Linux install with working Rust toolchain (docker or WSL ok). libbpf and linux-headers.
    ++ [
      libbpf
      linuxHeaders
    ]

    # Coverage: LLVM tools (not just clang). cargo-binutils provides an easy way to install these.
    #
    # Docs: https://github.com/rust-embedded/cargo-binutils
    #
    # Usage:
    # ```
    # rustup component add llvm-tools
    # ```
    ++ [ cargo-binutils ];

  # WASM: docker.
  # Network proxy: docker.
  # libstdc++ symbols: docker.
  virtualisation.docker.enable = true;
}
