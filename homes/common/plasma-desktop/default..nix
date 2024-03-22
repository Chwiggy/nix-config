{ config, lib, pkgs, home-manager, inputs, outputs, ... }:

{
  imports = [
    ./plasma-manager.nix
  ];
}