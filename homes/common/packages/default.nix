{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # development tools
    direnv
    kate
    ruff
    nix-tree
    nix-diff

    # language servers and debuggers for helix
    # TODO think about language server setup
    typst-lsp
    ruff-lsp
    rust-analyzer
    rocmPackages.llvm.lldb
    nil

    # shell stuff
    zellij
    helix
    zoxide

    # entertainment
    tidal-hifi

    # work
    zotero
    libreoffice
    qgis
    networkmanager-openconnect
    thunderbird

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
}