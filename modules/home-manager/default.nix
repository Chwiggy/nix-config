{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports = [
    ./autoclean-downloads.nix
  ];
}