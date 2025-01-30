{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      charliermarsh.ruff
      jnoortheen.nix-ide
      kamadorueda.alejandra
      mechatroner.rainbow-csv
      mkhl.direnv
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.debugpy
      ms-toolsai.jupyter
      ms-vscode-remote.remote-ssh
      myriad-dreamin.tinymist
      rust-lang.rust-analyzer
      tomoki1207.pdf
      vadimcn.vscode-lldb
    ];
  };
}
