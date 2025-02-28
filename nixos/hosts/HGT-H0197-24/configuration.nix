# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  pkgsStable,
  lib,
  nix-vscode-extensions,
  outputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Import shared settings
    ../../common
    ../../../disko/HGT-H0197-24
  ];
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      systemd-boot.configurationLimit = 3;
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    # Excluding zfs so it builds on the latest linux kernel
    supportedFilesystems = lib.mkForce ["bcachefs" "btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs"];
    # kernelParams = [
    #   "resume_offset=533760"
    # ];
    # resumeDevice = "/dev/diks/by-label/nixos";
  };

  # TODO change networking name through out
  networking = {
    hostName = "HGT-H0197-24"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager = {
      enable = true;
      ensureProfiles.profiles = {
        KT-Gruppe = {
          connection = {
            id = "KT-Gruppe";
            uuid = "08b1a4c0-94b4-4628-a37c-ad34744fd82";
            type = "wifi";
            permissions = "user:emily;";
          };
          wifi = {
            hidden = "true";
            mode = "infrastructure";
            ssid = "KT-Gruppe";
          };
          "802-1x" = {
            ca-cert = "/etc/ssl/certs/KTSV_R1.pem";
            eap = "peap";
            phase2-auth = "mschapv2";
            identity = "ewilke";
          };
          proxy = {};
          wifi-security = {
            key-mgmt = "wpa-eap";
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
    };
  };

  #root-certificate for KTA WiFi
  security.pki.certificateFiles = [./KTSV_R1.crt];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emily = {
    isNormalUser = true;
    initialPassword = "1235";
    description = "Emily C. Wilke";
    extraGroups = ["sudo" "networkmanager" "wheel" "libvirtd" "docker"];
    shell = pkgs.zsh;
  };

  environment.systemPackages =
    (with pkgs; [
      # potential packages not in ../common/default.nix
      sbctl
      cacert
      networkmanager-openvpn
    ])
    ++ (with pkgsStable; [
      # packages from stable go here:
      # docker-compose
    ]);

  nixpkgs.overlays = [
    outputs.overlays.modifications
    nix-vscode-extensions.overlays.default
  ];

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    liveRestore = false;
  };

  #open firewall for docker bridge network https://discourse.nixos.org/t/docker-container-not-resolving-to-host/30259/7
  networking.firewall = {
    enable = true;
    extraCommands = ''
      iptables -I INPUT 1 -s 172.16.0.0/12 -p tcp -d 172.17.0.1 -j ACCEPT
      iptables -I INPUT 2 -s 172.16.0.0/12 -p udp -d 172.17.0.1 -j ACCEPT
    '';
  };

  services.printing.drivers = [
    (pkgs.writeTextDir "share/cups/model/KOC750iGX.ppd" (builtins.readFile ./KOC750iGX.ppd))
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
