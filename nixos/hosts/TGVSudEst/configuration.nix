# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Import shared settings
    ../../common
    ../../../disko/TGVSudEst
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lotte = {
    isNormalUser = true;
    initialPassword = "1235";
    description = "Lotte";
    extraGroups = ["sudo" "networkmanager" "wheel" "libvirtd" "docker"];
    shell = pkgs.zsh;
  };
  users.users.emily = {
    isNormalUser = true;
    initialPassword = "1235";
    description = "Emily";
    extraGroups = ["sudo" "networkmanager" "wheel" "libvirtd" "docker"];
    shell = pkgs.zsh;
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

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    # TODO try again without in a few weeks
    permittedInsecurePackages = [
      "olm-3.2.16"
    ];
  };

  environment.systemPackages = with pkgs; [
    # potential packages not in ../common/default.nix
  ];

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  # Steam setup
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
