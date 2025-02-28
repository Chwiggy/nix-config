{
  imports = [
    ./wifionice.nix
  ];
  networking.networkmanager.ensureProfiles.profiles = {
    Keks = {
      connection = {
        id = "Keks";
        interface-name = "wlp0s20f3";
        type = "wifi";
        uuid = "6c93d505-a7f3-4260-8c74-27b0f0a29863";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
      proxy = {};
      wifi = {
        mode = "infrastructure";
        ssid = "Keks";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        leap-password-flags = "1";
        psk-flags = "1";
        wep-key-flags = "1";
      };
    };
    eduroam = {
      "802-1x" = {
        anonymous-identity = "eduroamHDcat2024@uni-heidelberg.de";
        ca-cert = "/home/lotte/.config/cat_installer/ca.pem";
        eap = "peap;";
        identity = "dg254@uni-heidelberg.de";
        password-flags = "1";
        phase2-auth = "mschapv2";
      };
      connection = {
        id = "eduroam";
        interface-name = "wlp0s20f3";
        type = "wifi";
        uuid = "5978a2fd-435e-485a-97e4-2bbd96786ae5";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
      proxy = {};
      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
    };
    "eduroam (real)" = {
      connection = {
        id = "eduroam (real)";
        type = "wifi";
        uuid = "8303387c-9535-40ac-be73-4baca7f29e38";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
      proxy = {};
      wifi = {
        mode = "infrastructure";
        ssid = "eduroam (real)";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk-flags = "1";
      };
    };
    RZL-hardcore = {
      connection = {
        id = "RZL-hardcore";
        type = "wifi";
        uuid = "f79dc8ea-783b-42c8-881e-4629b1e80652";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
      proxy = {};
      wifi = {
        mode = "infrastructure";
        ssid = "RZL-hardcore";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk-flags = "1";
      };
    };
  };
}
