{userSettings, ...}: {
  programs.thunderbird = {
    enable = true;
    profiles."${userSettings.username}" = {
      isDefault = true;
    };
  };
  accounts.email.accounts = {
    "gmail".thunderbird.enable = true;
    "rmail" = {
      thunderbird.enable = true;
      # can't activate this because of a bug in home-manager
      # TODO activate when the PR (see below) is merged
      # issue: https://github.com/nix-community/home-manager/issues/3712
      # PR: https://github.com/nix-community/home-manager/pull/5340
      # outgoing server
      # smtp = {
      #   host = "mail.rwth-aachen.de";
      #   port = 587;
      #   tls = {
      #     enable = true;
      #     useStartTls = true;
      #   };
      # };
    };
  };
}
