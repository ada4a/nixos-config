rec {
  nix-direnv = {
    description = "nix-direnv flake template for Rust projects";
    path = ./nix-direnv;
  };
  default = nix-direnv;
}
