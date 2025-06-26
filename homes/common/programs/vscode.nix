{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-marketplace;
      [
        #theming
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        #setup
        mkhl.direnv

        # git stuff
        eamodio.gitlens

        # nix world
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        kamadorueda.alejandra

        # python world
        ms-python.vscode-pylance
        ms-python.python
        ms-python.debugpy
        # ms-toolsai.jupyter

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
      ]
      ++ (with pkgs.vscode-extensions; [
        ms-toolsai.jupyter
        vadimcn.vscode-lldb
      ]);
  };
}
