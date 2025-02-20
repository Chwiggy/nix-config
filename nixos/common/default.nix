{
  outputs,
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./input
    ./locale
    ./pkgconfigs
    ./networks
    ./services
  ];

  #nix configurations
  nix = {
    package = pkgs.nixVersions.stable;
    #extraOptions = ''
    #  experimental-features = nix-command flakes
    #'';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
      randomizedDelaySec = "15min";
      persistent = true;
    };

    settings.experimental-features = "nix-command flakes";
    settings.auto-optimise-store = true;
  };

  hardware = {
    # Enable bluetooth
    bluetooth.enable = true;
    # Necessary changes for steam
    graphics.enable32Bit = true;
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    # TODO sort and cross reference with homes
    # TODO add container engine
    alejandra
    curl
    fzf
    git
    htop
    helix
    tree
    bat
    wayland
    nix-output-monitor
    vscode
    kitty
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    oxygen
    plasma-browser-integration
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    outputs.overlays.additions
  ];

  # Shell settings
  programs.zsh = {
    enable = true;
  };
  # Enable completion of system packages by zsh
  environment.pathsToLink = ["/share/zsh"];
}
