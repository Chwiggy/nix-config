# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  sops-nix,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Import shared settings
    ../../common
    ../../../disko/TGVSudEst
    <sops-nix/modules/sops>
  ];

  sops = {
    defaultSopsFile = ../../secrets/sops.yaml;
    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    # This is using an age key that is expected to already be in the filesystem
    age.keyFile = "/var/lib/sops-nix/key.txt";
    # This will generate a new key if the key specified above does not exist
    age.generateKey = true;
    # This is the actual specification of the secrets.
    secrets.example-key = {};
    secrets."myservice/my_subdir/my_secret" = {};
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    # Excluding zfs so it builds on the latest linux kernel
    supportedFilesystems = lib.mkForce ["bcachefs" "btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs"];
  };

  networking = {
    hostName = "TGVSudEst"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  hardware = {
    # Enable bluetooth
    bluetooth.enable = true;
    # Audio Setup
    pulseaudio.enable = false;
    # Necessary changes for steam
    graphics.enable32Bit = true;
  };

  security.rtkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # potential packages not in ../common/default.nix
  ];

  # Steam setup
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # List services that you want to enable:
  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Audio with pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
