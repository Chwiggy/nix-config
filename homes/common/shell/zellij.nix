{lib, ...}: {
  programs.zellij = {
    # This autostarts zellij on zsh start
    # TODO find specific settings for vscode to avoid
    #enable = true;
    enableZshIntegration = true;
  };

  home.file = {
    "zellij" = {
      source = ./zellij.kdl;
      target = ".config/zellij/config.kdl";
    };
  };
}
