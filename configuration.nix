{ config, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];

  # Let demo build as a trusted user.
  nix.settings.trusted-users = [ "demo" ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "compose:ralt";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # \$ nix search wget
  environment.systemPackages = with pkgs; [
    git
    gcc
    sl
    wget
    vscode
    firefox
    direnv
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # programs.direnv.enable = true;

}
