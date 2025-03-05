{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Disko for declaratively setting disk formatting
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Managing KDE Plasma hopefully
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Lix
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    envfs.url = "github:Mic92/envfs";
    envfs.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    plasma-manager,
    disko,
    lix-module,
    lanzaboote,
    nix-vscode-extensions,
    envfs,
    nixos-hardware,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc

    packages = forAllSystems (system: nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # I want more computers to install nix on
      TGVSudEst = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/hosts/TGVSudEst/configuration.nix
          lix-module.nixosModules.default
          disko.nixosModules.disko
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.common-pc-ssd
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              inputs.plasma-manager.homeManagerModules.plasma-manager
              outputs.homeManagerModules
              ./homes/common
              ./homes/hosts/TGVSudEst
            ];
            home-manager.users.lotte = import ./homes/lotte.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
          {_module.args = {inherit nix-vscode-extensions;};}
        ];
      };

      customISO = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
          "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
          disko.nixosModules.disko
          ./nixos/hosts/customISO/configuration.nix
          lix-module.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              inputs.plasma-manager.homeManagerModules.plasma-manager
              outputs.homeManagerModules
              ./homes/common
            ];
            home-manager.users.lotte = import ./homes/lotte.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      HGT-H0197-24 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/hosts/HGT-H0197-24/configuration.nix
          lix-module.nixosModules.default
          disko.nixosModules.disko
          lanzaboote.nixosModules.lanzaboote
          nixos-hardware.nixosModules.lenovo-thinkpad-t14
          nixos-hardware.nixosModules.common-cpu-intel
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              inputs.plasma-manager.homeManagerModules.plasma-manager
              outputs.homeManagerModules
              ./homes/common
              ./homes/hosts/HGT-H0197-24
            ];
            home-manager.users.emily = import ./homes/emily.nix;
            home-manager.users.lotte = import ./homes/lotte.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
          envfs.nixosModules.envfs
          {_module.args = {inherit nix-vscode-extensions;};}
        ];
      };
    };
  };
}
