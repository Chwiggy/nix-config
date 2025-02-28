{
  programs.thunderbird = {
    enable = true;
    policies = {
      Preferences = {
        "browser.tabs.inTitlebar" = 0;
        "mail.uidensity" = 0;
        "mail.tabs.drawInTitlebar" = false;
        "mail.biff.play_sound" = false;
        "mail.biff.use_system_alert" = true;
        "font.name.serif.x-western" = "Crimson";
        "font.name.sans-serif.x-western" = "Atkinson Hyperlegible";
        "font.name.monospace.x-western" = "FiraCode Nerd Font";
        "font.size.variable.x-western" = 14;
      };
      DisableTelemetry = true;
      ExtensionSettings = {
        # German Language Dictionary:
        "de-DE@dictionaries.addons.mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dictionary-german/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
