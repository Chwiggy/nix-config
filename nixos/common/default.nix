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
    };

    settings.experimental-features = "nix-command flakes";
    settings.auto-optimise-store = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lotte = {
    isNormalUser = true;
    initialPassword = "1235";
    description = "Lotte";
    extraGroups = ["sudo" "networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  # Shell settings
  programs.zsh = {
    enable = true;
  };
  # Enable completion of system packages by zsh
  environment.pathsToLink = ["/share/zsh"];
}
