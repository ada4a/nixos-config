{ config, ... }:
{
  programs.ssh = {
    enable = true;
  };

  # https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
  programs.git = {
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    };
    extraConfig = {
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
    };
  };

  programs.lazygit.settings = {
    git.overrideGpg = true; # to allow rewording commits
  };

}
