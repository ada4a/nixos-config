{ userSettings, ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles."${userSettings.username}" = {
      isDefault = true;
    };
    settings = {
      # automatically send crash reports
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = true;
      "mail.SpellCheckBeforeSend" = true;
      # automatically save draft every N minutes
      "mail.compose.autosaveinterval" = 1;
      "mail.spellchecker.dictionary" = "en-US,de-DE";
    };
  };

  accounts.email.accounts = {
    "gmail".thunderbird = {
      enable = true;
      # HACK to enable OAuth2
      # https://github.com/nix-community/home-manager/issues/4988#issue-2113760749
      settings = id: {
        "mail.smtpserver.smtp_${id}.authMethod" = 10;
        "mail.server.server_${id}.authMethod" = 10;
      };
    };
    "rmail".thunderbird.enable = true;
  };
}
