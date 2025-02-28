{
  # List services that you want to enable:
  services = {
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Audio with pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };
    pulseaudio.enable = false;

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = false;
      openFirewall = true;
    };
  };
}
