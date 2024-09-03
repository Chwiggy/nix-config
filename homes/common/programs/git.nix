{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.git = {
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
}
