{ inputs, outputs, config, lib, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "dvorak";
    xkb.options = "compose:ralt";
  };

  # Configure console keymap
  console.keyMap = "dvorak";
}