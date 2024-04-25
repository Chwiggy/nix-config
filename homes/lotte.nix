{
  config,
  pkgs,
  plasma-manager,
  ...
}: {
  imports = [
    ./common/plasma-desktop
    ./common/shell
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lotte";
  home.homeDirectory = "/home/lotte";

  # user packages
  home.packages = with pkgs; [
    # development tools
    direnv
    kate
    ruff

    # language servers and debuggers for helix
    typst-lsp
    python311Packages.python-lsp-server
    rust-analyzer
    rocmPackages.llvm.lldb
    nil

    # shell stuff
    zellij
    helix
    zoxide

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
    spotify
    freetube
    openttd-jgrpp
    vlc

    # work
    zotero
    libreoffice
    qgis
    networkmanager-openconnect

    # wiki
    obsidian

    # fonts
    atkinson-hyperlegible
    crimson
    crimson-pro
    noto-fonts
    #nerdfonts

    # utilities
    unzip
  ];

  # adding wallpaper
  home.file = {
    "wallpaper" = {
      enable = true;
      source = ./common/wallpaper.png;
      target = ".wallpaper/wallpaper.png";
    };
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userEmail = "emiilycwilke@gmail.com";
      userName = "Chwiggy";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        "*.direnv"
        "*.vscode"
        ".envrc"
      ];
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        jnoortheen.nix-ide
        arrterian.nix-env-selector
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        ms-toolsai.jupyter
        nvarner.typst-lsp
        tomoki1207.pdf
        kamadorueda.alejandra
      ];
    };

    zellij = {
      # This autostarts zellij on zsh start
      # TODO find specific settings for vscode to avoid
      #enable = true;
      enableZshIntegration = true;
      settings.session_serialization = false;
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
