{pkgs, ...}: {
  imports = [
    ./email/emily.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lotte";
  home.homeDirectory = "/home/lotte";

  # user packages
  home.packages = with pkgs; [
    # art programs
    krita
    scribus
    gimp
    wl-color-picker
    # TODO affinity-crimes
    #wine

    # messaging apps
    #discord
    webcord
    nheko
    signal-desktop

    # entertainment
    freetube
    openttd-jgrpp
    vlc
  ];

  # adding wallpaper
  home.file = {
    "wallpaper" = {
      source = ./wallpaper/lotte.png;
      target = ".wallpaper/wallpaper.png";
    };
  };

  programs.git = {
    userEmail = "emilycwilke@gmail.com";
    userName = "Chwiggy";
  };

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
