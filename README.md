# Lotte's Nixos Configurations

## Dependencies
Flake support must be enabled.

## Usage
### Building a new ISO
```console
$ sudo nix build .#nixosConfigurations.customISO.config.system.build.isoImage
```
This might take a while to build ... especially the creating the squashfs filesystem might take up to an hour.

### Installing a config

Flash the ISO to a USB drive using `dd`, for example:
```console
$ sudo dd if=result/iso/{your.iso} of=/dev/sda bs=1M status=progress
```

Boot your new device from the usb drive.
Clone this config using
```console
$ git clone https://github.com/Chwiggy/nix-config.git
```
switch to the branch you want to install
list the existing drives with `lsblk` to write your desired disko configuration
Run disko to set up the partitions as you declared them in your disko config:
```console
$ sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix
```
Test if things worked correctly by
```console
$ mount | grep /mnt
```

If this is a fresh install, and you haven't generated a hardware configuration yet run
```console
$ nixos-generate-config --no-filesystems --root /mnt
```
and move the result in the correct location in `.hosts/{your-nixos-config}

finish your install by running
```console
$ nixos-install
$ reboot
```

### Switching to a config

```console
$ sudo nixos-rebuild switch --flake .#{Config}
```

If you don't want to change between different configs you can just use
```console
$ sudo nixos-rebuild switch --flake .
```