{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lotte";
  home.homeDirectory = "/home/lotte";

  # user packages
  home.packages = with pkgs; [
      firefox
      kate
      direnv

      # messaging apps
      discord
      nheko
      signal-desktop

      # entertainment
      spotify
      freetube
      
      # work
      zotero
      typst-lsp
      onlyoffice-bin

      #fonts
      atkinson-hyperlegible
      crimson
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