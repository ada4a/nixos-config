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
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
      git-rwth = {
        HostName = "git.rwth-aachen.de";
        WarnWeakCrypto = "no";
      };
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
