{
  config,
  pkgs,
  plasma-manager,
  ...
}: {
  imports = [
    ./common/plasma-desktop
    ./common/shell
    ./common/email
    ./common/programs
    ./common/packages
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
    inkscape
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
    "konsole-theme" = {
      source = ./common/plasma-desktop/Catppuccin-Macchiato.colorscheme;
      target = ".local/share/konsole/Catppuccin-Macchiato.colorscheme";
    };
  };

  systemd.user = {
    # Nicely reload system units when changing configs
    startServices = "sd-switch";
    # Auto clean folders
    tmpfiles.rules = let
      home = config.home.homeDirectory;
    in [
      # Autoclean ~/Downloads
      "d ${home}/Downloads - - - 14d -"
      "d ${home}/tmp - - - 3d -"
    ];
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
