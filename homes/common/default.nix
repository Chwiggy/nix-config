{config, ...}: {
  imports = [
    ./plasma-desktop
    ./shell
    ./email
    ./programs
    ./packages
  ];

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
