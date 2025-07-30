{
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
      userName = "emily.wilke@heigit.org";
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
          Emily C. Wilke (any pronouns)
          Research Associate / Plugin Developer
          HeiGIT gGmbH (Heidelberg Institute for Geoinformation Technology at Heidelberg University)

          heigit.org | emily.wilke@heigit.org
          Postal address: Schloss-Wolfsbrunnenweg 33 | 69118 Heidelberg | Germany
          Offices: Berliner Str. 45 | 69120 Heidelberg | Germany
          Amtsgericht Mannheim | HRB 733765
          Managing Directors: Prof. Dr. Alexander Zipf | Dr. Gesa Schönberger
        '';
        showSignature = "append";
      };
    };
    Uniheidelberg = {
      primary = false;
      thunderbird = {
        enable = true;
        perIdentitySettings = id: {
          "mail.identity.id_${id}.reply_on_top" = 1;
        };
      };
      realName = "Emily C. Wilke";
      address = "dg254@uni-heidelberg.de";
      userName = "dg254";
      imap = {
        host = "imap.urz.uni-heidelberg.de";
        port = 993;
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
      smtp = {
        host = "imap.urz.uni-heidelberg.de";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      signature = {
        text = ''
          Emily C. Wilke (any pronouns)
          Guest Researcher
          Geographisches Institut, Abteilung Geoinformatik, Ruprecht-Karls-Universität Heidelberg
          Postal address: Im Neuenheimer Feld 368 | 69120 Heidelberg | Germany
        '';
        showSignature = "append";
      };
    };
  };
}
