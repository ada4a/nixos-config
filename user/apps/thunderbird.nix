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
    "rmail".thunderbird.enable = true;
  };
}
