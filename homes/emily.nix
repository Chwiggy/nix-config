{
  config,
  pkgs,
  plasma-manager,
  ...
}: {
  imports = [
    ./email/emily.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # user packages
  home.packages = with pkgs; [
    # communication apps
    rocketchat-desktop
    zoom-us

    # oh pycharm
    jetbrains.pycharm-professional
    jetbrains.idea-ultimate
    # why is your software so bad 🎶
    jetbrains-toolbox
  ];

  # adding wallpaper
  home.file = {
    "wallpaper" = {
      source = ./wallpaper/emily.png;
      target = ".wallpaper/wallpaper.png";
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
    userEmail = "Emily.Wilke@heigit.org";
    userName = "Emily C. Wilke";
    ignores = ["*.envrc"];
  };

  programs.vscode = {
    profiles.default.extensions = with pkgs.vscode-marketplace; [
      #Java World
      # TODO why on earth is this broken
      # redhat.java
      vscjava.vscode-java-pack
      vscjava.vscode-maven
      vscjava.vscode-gradle
      vscjava.vscode-java-test
      vscjava.vscode-java-dependency
      vscjava.vscode-java-debug
    ];
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
}
