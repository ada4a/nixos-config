{ userSettings, ... }:
let
  signature = ''
    Mit freundlichen Grüßen
    ${userSettings.name}
  '';
in
{
  accounts.email.accounts = {
    "pmail" = {
      address = userSettings.pmail;
      realName = userSettings.name;
      signature.text = signature;
      primary = true;
    };
    "rmail" = {
      address = userSettings.rmail;
      userName = "wz504737@rwth-aachen.de";
      realName = userSettings.name;
      signature.text = signature;
      # incoming server
      imap = {
        host = "mail.rwth-aachen.de";
        port = 993;
        tls.enable = true;
      };
      # outgoing server
      smtp = {
        host = "mail.rwth-aachen.de";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
    };
  };
}
