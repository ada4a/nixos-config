{
  stdenv,
  fetchFromGitLab,
  meson,
  ninja,
  pkg-config,
  libdrm,
}:

stdenv.mkDerivation {
  pname = "memresever";
  version = "0.1.0";

  src = fetchFromGitLab {
    domain = "git.dolansoft.org";
    owner = "lorenz";
    repo = "memreserver";
    rev = "480253e565dab935df1d1c4e615ebc8a8dc81ba4";
    hash = "sha256-HjcrH98hH2zKdsHolYCFugL39sT1VjroVhRf8a8dpIA=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    libdrm
  ];
}
