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
    nix-tree
    nix-diff

    # language servers and debuggers for helix
    typst-lsp
    ruff-lsp
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
    tidal-hifi
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
    font-awesome
    #nerdfonts

    # utilities
    unzip
  ];

  # adding wallpaper
  home.file = {
    "wallpaper" = {
      source = ./common/wallpaper.png;
      target = ".wallpaper/wallpaper.png";
    };
    "konsole-theme" = {
      source = ./common/plasma-desktop/Catppuccin-Macchiato.colorscheme;
      target = ".local/share/konsole/Catppuccin-Macchiato.colorscheme";
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
      userEmail = "emilycwilke@gmail.com";
      userName = "Chwiggy";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        "*.direnv"
        "*.vscode"
      ];
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        arrterian.nix-env-selector
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        ms-toolsai.jupyter
        nvarner.typst-lsp
        tomoki1207.pdf
        kamadorueda.alejandra
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        mechatroner.rainbow-csv
      ];
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
