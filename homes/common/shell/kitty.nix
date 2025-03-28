{pkgs, ...}: let
  meowLocation = ".config/kitty/meow.wav";
in {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "Atkinson Monolegible";
      package = pkgs.atkinson-hyperlegible-mono;
      size = 11;
    };
    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = true;
      visual_bell_duration = 0.4;
      bell_on_tab = "🔔 ";
      confirm_os_window_close = 0;
      wayland_enable_ime = false;
      bell_path = "~/${meowLocation}";
    };
  };

  home.file."meow" = {
    source = ./meow.wav;
    target = meowLocation;
  };
}
