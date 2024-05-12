{userSettings, ...}: {
  programs.thunderbird = {
    enable = true;
    profiles."${userSettings.username}" = {
      isDefault = true;
    };
  };
  # accounts.email.accounts = {
  #   "gmail".thunderbird.enable = true;
  #   "rmail" = {
  #     thunderbird.enable = true;
  #     # outgoing server
  #     smtp = {
  #       host = "mail.rwth-aachen.de";
  #       port = 587;
  #       tls = {
  #         enable = true;
  #         useStartTls = true;
  #       };
  #     };
  #   };
  # };
}
