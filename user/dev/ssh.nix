{ lib, config, ... }:
let
  cfg = config.programs.ssh;
in
{
  programs.ssh = {
    enable = true;
    # set the default config
    # https://github.com/nix-community/home-manager/pull/7655
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
  };

  # https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
  programs.git = lib.mkIf cfg.enable {
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    };
    settings = {
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
    };
  };

  programs.lazygit.settings = lib.mkIf cfg.enable {
    git.overrideGpg = true; # to allow rewording commits
  };

}
