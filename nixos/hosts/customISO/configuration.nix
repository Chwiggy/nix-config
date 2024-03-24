{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nixpkgs-stable,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
}