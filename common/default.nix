{ config, lib, pkgs, home-manager, ... }:

{
  imports = [
    ./input
    ./locale
    ./pkgconfigs
  ];
}