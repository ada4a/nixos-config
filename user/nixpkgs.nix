{output, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    inherit (output) overlays;
  };
}
