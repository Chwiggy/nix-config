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
      theme = "catppuccin_macchiato";
      editor = {
        auto-format = true;
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
        soft-wrap = {
          enable = true;
          max-wrap = 25;
          wrap-indicator = "";
        };
      };
    };
    languages = {
      language = [
        {
          name = "python";
          language-id = "python";
          auto-format = true;
          file-types = ["py"];
          language-servers = with pkgs; ["${ruff-lsp}/bin/ruff-lsp"];
          formatter = {
            command = with pkgs; "${ruff}/bin/ruff";
            args = ["format" "--line-lengths" "120" "-"];
          };
        }
        {
          name = "typst";
          language-id = "typst";
          auto-format = false;
          file-types = ["typ"];
          language-servers = ["typst-lsp"];
        }
        {
          name = "rust";
          language-id = "rust";
          auto-format = true;
          file-types = ["rs"];
          roots = ["Cargo.lock"];
          language-servers = ["rust-analyzer"];
        }
        {
          name = "nix";
          language-id = "nix";
          auto-format = true;
          file-types = ["nix"];
          roots = ["flake.lock" "flake.nix"];
          language-servers = with pkgs; ["${nil}/bin/nil"];
          # TODO how to get the auto-format to work
          formatter = {
            command = with pkgs; "${alejandra}/bin/alejandra";

            # comment misaligned
          };
        }
      ];
      language-server = {
        ruff-lsp = {
          command = "ruff-lsp";
        };
        typst-lsp = {
          command = "typst-lsp";
        };
        rust-analyzer = {
          command = "rust-analyzer";
        };
        nil = {
          command = "nil";
        };
      };
    };
  };
}
