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
    inputs.home-manager.nixosModules.home-manager

    # Import shared settings
    ../../common
  ];

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

  networking.networkmanager.enable = true;


}