# Lotte's Nixos Configurations

## Dependencies
Flake support must be enabled.

## Usage
### Building a new ISO
```bash
sudo nix build .#nixosConfigurations.customISO.config.system.build.isoImage
```
This might take a while to build ..

### Installing a config
```bash
sudo nixos-rebuild switch --flake .#{Config}
```