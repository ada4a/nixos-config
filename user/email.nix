{userSettings, ...}: let
  signature = ''
    Mit freundlichen Grüßen
    Ughur Alakbarov
  '';
in {
  accounts.email.accounts = {
    "gmail" = {
      address = userSettings.gmail;
      flavor = "gmail.com";
      primary = true;
      realName = userSettings.name;
      signature.text = signature;
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
