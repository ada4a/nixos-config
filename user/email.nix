{userSettings, ...}: let
  signature = ''
    Mit freundlichen Grüßen
    ${userSettings.name}
  '';
in {
  accounts.email.accounts = {
    "gmail" = {
      address = userSettings.gmail;
      flavor = "gmail.com";
      primary = true;
      realName = userSettings.name;
      signature.text = signature;
      imap = {
        port = 993;
        tls.enable = true;
      };
      smtp = {
        port = 465;
        tls.enable = true;
      };
    };
    "pmail" = {
      address = userSettings.pmail;
      realName = userSettings.name;
      signature.text = signature;
    };
    "rmail" = {
      address = userSettings.rmail;
      realName = userSettings.name;
      signature.text = signature;
    };
  };
}
