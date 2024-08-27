{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./default.nix];
  # TODO ask work for email/network configs if applicable
  accounts.email.accounts = {
    HeiGit = {
      primary = true;
      thunderbird = {
        enable = true;
        perIdentitySettings = id: {
          "mail.identity.id_${id}.reply_on_top" = 1;
        };
      };
      realName = "Emily C. Wilke";
      address = "Emily.Wilke@heigit.org";
      userName = "ewilke";
      imap = {
        host = "webmail.villa-bosch.de";
        port = 993;
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
      smtp = {
        host = "webmail.villa-bosch.de";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      signature = {
        text = ''
          Emily C. Wilke
          HeiGIT gGmbH
          Heidelberg Institute for Geoinformation Technology at Heidelberg University

          https://heigit.org | Emily.Wilke@heigit.org

          Postal address: Schloss-Wolfsbrunnenweg 33 | 69118 Heidelberg | Germany
          Offices: Berliner Str. 45 | 69120 Heidelberg | Germany

          Amtsgericht Mannheim | HRB 733765
          Managing Directors: Prof. Dr. Alexander Zipf | Dr. Gesa Schönberger
        '';
        showSignature = "append";
      };
    };
  };
}
