{
  lib,
  rustPlatform,
  fetchgit,
  withDotty ? true,
  git,
}:

rustPlatform.buildRustPackage rec {
  pname = "mergiraf";
  version = "0.2.0";

  src = fetchgit {
    url = "https://codeberg.org/mergiraf/mergiraf";
    rev = "v${version}";
    hash = "sha256-egtX2daCbPXi5rX2OxbEZA/VI9R4HMj5LRKbUEBFo+E=";
  };

  # needed since the package has git dependencies
  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "tree-sitter-yaml-0.6.1" = "sha256-gS+SjOnGl/86U9VV/y1ca7naYIe7DAOvOv++jCRLTKo=";
      "tree-sitter-xml-0.7.0" = "sha256-RTWvOUAs3Uql9DKsP1jf9FZZHaZORE40GXd+6g6RQZw=";
      "tree-sitter-go-0.23.1" = "sha256-elPqkvVYs0vADOuN/umDteWP5hqcXhQAoSkqYDtTxaU=";
    };
  };

  nativeCheckInputs = [
    git
  ];

  buildFeatures = lib.optional withDotty "dotty";

  meta = with lib; {
    description = "A syntax-aware git merge driver for a growing collection of programming languages and file formats.";
    homepage = "https://mergiraf.org";
    changelog = "https://codeberg.org/mergiraf/mergiraf/releases/tag/v${version}";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [
      # me!
    ];
    mainProgram = "mergiraf";
  };
}
