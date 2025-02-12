{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-marketplace; [
      #theming
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      mkhl.direnv

      # nix world
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      kamadorueda.alejandra

      # python world
      charliermarsh.ruff
      ms-python.python
      ms-python.debugpy
      ms-toolsai.jupyter

      #data world
      mechatroner.rainbow-csv

      # vscode stuff
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh

      # typst world
      myriad-dreamin.tinymist
      tomoki1207.pdf

      # rust world
      rust-lang.rust-analyzer
      # TODO add again once https://nixpk.gs/pr-tracker.html?pr=380775 is through
      # vadimcn.vscode-lldb

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
}
