{inputs, ...}: {
  flake-inputs = import ./flake-inputs.nix {inherit inputs;};
}
