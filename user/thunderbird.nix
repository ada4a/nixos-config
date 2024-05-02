{userSettings, ...}: {
  programs.thunderbird = {
    enable = true;
    profiles."${userSettings.username}" = {
      isDefault = true;
    };
  };
  accounts.email.accounts = {
    "gmail".thunderbird.enable = true;
    "rmail".thunderbird.enable = true;
  };
}
