{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Managing KDE Plasma hopefully
    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = inputs@{ nixpkgs, home-manager, plasma-manager, ... }: {
    nixosConfigurations = {
      # I want more computers to install nix on
      TGVSudEst = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/hosts/TGVSudEst/configuration.nix
          # ./common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [inputs.plasma-manager.homeManagerModules.plasma-manager];
            home-manager.users.lotte = import ./homes/lotte.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      customISO = nixpkgs.lib.nixos {
        system = "x86_64-linux";
        modules = [
          # ISO things
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
          "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"

          ./nixos/hosts/customIso/configuration.nix
          # ./common/
          home.manager.nixosModules.home-manager
          {
            home-manager.sharedModules = [inputs.plasma-manager.homeManagerModules.plasma-manager];
          }
        ];
      };
    };
  };
}
