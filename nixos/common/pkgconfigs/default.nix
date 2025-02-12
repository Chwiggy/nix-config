{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    ./firefox.nix
    ./thunderbird.nix
  ];

  # for vscode
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
