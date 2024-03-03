{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lotte";
  home.homeDirectory = "/home/lotte";

  # user packages
  home.packages = [
      pkgs.firefox
      pkgs.kate
      pkgs.vscode

      # messaging apps
      pkgs.discord
      pkgs.nheko
      pkgs.signal-desktop

      # entertainment
      pkgs.spotify
      pkgs.freetube
      
      # work
      pkgs.zotero
      pkgs.onlyoffice-desktopeditors
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}