{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
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
}
