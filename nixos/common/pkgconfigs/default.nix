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
}
