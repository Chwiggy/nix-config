{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./starship.nix
    ./helix.nix
  ];
}
