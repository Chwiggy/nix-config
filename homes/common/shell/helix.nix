{
  config,
  lib,
  pkgs,
  ...
}: {
  # TODO dig into theme and settings
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        cursorline = true;
        bufferline = "always";
        color-modes = true;
      };
    };
  };
}
