{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./vscode.nix
  ];
}
