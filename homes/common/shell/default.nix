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
    ./zellij.nix
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font.name = "Atkinson Monolegible";
    font.package = pkgs.atkinson-monolegible;
    shellIntegration.enableZshIntegration = true;
  };
}
