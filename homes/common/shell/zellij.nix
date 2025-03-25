{
  programs.zellij = {
    # This autostarts zellij on zsh start
    # TODO find specific settings for vscode to avoid
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-macchiato";
      themes.catppuccin-macchiato = {
        bg = "#5b6078"; # Surface2
        fg = "#cad3f5";
        red = "#ed8796";
        green = "#a6da95";
        blue = "#8aadf4";
        yellow = "#eed49f";
        magenta = "#f5bde6"; # Pink
        orange = "#f5a97f"; # Peach
        cyan = "#91d7e3"; # Sky
        black = "#1e2030"; # Mantle
        white = "#cad3f5";
      };
      show_startup_tips = false;
    };
  };
}
