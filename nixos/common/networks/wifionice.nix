{pkgs, ...}: {
  networking.networkmanager.ensureProfiles.profiles = {
    WIFIonICE = {
      connection = {
        id = "WIFIonICE";
        type = "wifi";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "WIFIonICE";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };

  # curtesy of https://gitlab.com/ada.loveless/nix/-/blob/master/network/WIFIonICE.nix
  networking.networkmanager.dispatcherScripts = [
    {
      #!/usr/bin/env bash
      source = pkgs.writeText "connect_ice" ''
        set -euxo pipefail
        # Run if ssid is WIFIonICE
        # Run if state is up
        ACTION="$2"
        if [[ "$ACTION" == "up" ]]
        then
          if [[ "$CONNECTION_ID" == "WIFIonICE" ]]
          then
            ${pkgs.curl}/bin/curl 'https://login.wifionice.de/cna/logon' -sSL -X POST
          fi
        fi
      '';
      type = "basic";
    }
  ];
}
