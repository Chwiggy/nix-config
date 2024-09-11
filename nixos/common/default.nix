{
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
    package = pkgs.nixFlakes;
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
    # Audio Setup
    pulseaudio.enable = false;
    # Necessary changes for steam
    graphics.enable32Bit = true;
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    # TODO sort and cross reference with homes
    # TODO add container engine
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
  ];

  nixpkgs.config.allowUnfree = true;

  # Shell settings
  programs.zsh = {
    enable = true;
  };
  # Enable completion of system packages by zsh
  environment.pathsToLink = ["/share/zsh"];
}
