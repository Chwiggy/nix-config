{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
   ];

  # Let demo build as a trusted user.
  nix.settings.trusted-users = [ "demo" ];
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.defaultSession = "plasmawayland";
  };

  console.keyMap = "dvorak";
  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "compose:ralt";
  };

  hardware.pulseaudio.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # \$ nix search wget
  environment.systemPackages = with pkgs; [
    direnv
    firefox
    git
    glxinfo
    home-manager
    sl
    sway
    wget
    wayland
    vscode
  ];

  users.users.demo = {
    isNormalUser = true;
    description = "Demo user account";
    extraGroups = ["wheel" "vboxsf"];
    password = "demo";
    uid = 1000;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # programs.direnv.enable = true;

}
