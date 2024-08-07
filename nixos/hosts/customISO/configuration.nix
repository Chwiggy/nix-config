{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nixpkgs-stable,
  ...
}: {
  imports = [
    # Import shared settings
    ../../common
  ];

  boot.loader.systemd-boot.enable = true;
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = false;
  networking.domain = "";
  services.openssh = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    aha
    git
    zsh
  ];

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  networking.networkmanager.enable = true;

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
  boot.supportedFilesystems = lib.mkForce ["bcachefs" "btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
