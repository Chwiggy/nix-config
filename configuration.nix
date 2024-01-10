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
# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
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
   wget
vscode
firefox ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
