{
  lib,
  rustPlatform,
  fetchFromGitHub,
  libcosmicAppHook,
  just,
  pkg-config,
  libxkbcommon,
  udev,
  nix-update-script,
}:
let
  rev = "f74b562a09e88e8d20ee0b9c5ab8cade8e4edbdb";
in
rustPlatform.buildRustPackage {
  pname = "clipboard-manager";
  version = "0.1.0-git";

  src = fetchFromGitHub {
    owner = "cosmic-utils";
    repo = "clipboard-manager";
    inherit rev;
    hash = "sha256-tWNf0YZzVXM8FsA/jhGSrdPvnLRaVzQ1prYWINAGNN8=";
  };

  cargoHash = "sha256-DmxrlYhxC1gh5ZoPwYqJcAPu70gzivFaZQ7hVMwz3aY=";

  nativeBuildInputs = [
    libcosmicAppHook
    just
    pkg-config
  ];

  buildInputs = [
    libxkbcommon
    udev
  ];

  justFlags = [
    "--set"
    "prefix"
    (placeholder "out")
    "--set"
    "CLIPBOARD_MANAGER_COMMIT"
    rev
  ];

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--version"
      "branch=HEAD"
    ];
  };

  meta = {
    description = "Clipboard manager for COSMIC™";
    homepage = "https://github.com/cosmic-utils/clipboard-manager";
    license = lib.licenses.gpl3Only;
    mainProgram = "clipboard-manager";
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
