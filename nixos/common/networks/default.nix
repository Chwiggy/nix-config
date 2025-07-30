{
  imports = [
    ./wifionice.nix
  ];
  networking.networkmanager.ensureProfiles.profiles = {
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
