{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lotte";
  home.homeDirectory = "/home/lotte";

  # user packages
  home.packages = with pkgs; [
      #browsing
      firefox
      
      # development tools
      direnv
      
      # TODO add the following packages and config for them
      # zellij
      helix
      # zoxide

      # art programs
      krita
      inkscape
      scribus
      # TODO affinity-crimes
      wine

      # messaging apps
      discord
      nheko
      signal-desktop

      # entertainment
      spotify
      freetube
      openttd-jgrpp
      vlc

      # work
      zotero
      typst
      typst-lsp
      # onlyoffice-bin
      libreoffice
      qgis

      #fonts
      atkinson-hyperlegible
      crimson
      nerdfonts
  ];


  # vscode
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      mkhl.direnv
      github.vscode-pull-request-github
      ms-vscode-remote.remote-ssh
      rust-lang.rust-analyzer
      ms-toolsai.jupyter
      nvarner.typst-lsp
    ];
  };

  programs.git = {
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

  # ZSH config
  programs.starship = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "sha256-Z6EYQdasvpl1P78poj9efnnLj7QQg13Me8x1Ryyw+dM=";
        };
      }
    ];

    
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases.ll = "ls -l";
    historySubstringSearch.enable = true;
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "branch"
        "colored-man-pages"
        "git"
        "github"
        "gitignore"
        "history"
        "history-substring-search"
        "isodate"
        "jsontools"
        "man"
        "pip"
        "pipenv"
        "python"
        "systemd"
        "themes"
        "urltools"
        "zsh-interactive-cd"
        "rsync"
      ];
      theme = "jtriley";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


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