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
      theme = "dracula";
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
    themes = {
      dracula = let
        transparent = "none";
        background = "#282A36";
        current-line = "#44475A";
        foreground = "#F8F8F2";
        comment = "#6272A4";
        cyan = "#8BE9FD";
        green = "#50FA7B";
        orange = "#FFB86C";
        pink = "#FF79C6";
        purple = "#BD93F9";
        red = "#FF5555";
        yellow = "#F1FA8C";
      in {
        # Syntax Highlighting
        "attribute" = yellow;

        "type" = {
          fg = cyan;
          modifiers = "italic";
        };

        "constant" = purple;
        "constant.character.escape" = pink;

        "string" = yellow;
        "string.regexp" = red;

        "comment" = comment;

        "variable" = foreground;
        "variable.parameter" = {
          fg = orange;
          modifiers = ["italic"];
        };
        "variable.other.member" = {
          fg = orange;
          modifiers = ["italic"];
        };

        "punctuation" = foreground;
        "punctuation.special" = pink;

        "keyword" = pink;

        "operator" = pink;

        "function" = green;

        "tag" = pink;

        "markup.heading" = {
          fg = purple;
          modifiers = ["bold"];
        };
        "markup.list" = cyan;
        "markup.bold" = {
          fg = orange;
          modifiers = ["bold"];
        };
        "markup.italic" = {
          fg = yellow;
          modifiers = ["italic"];
        };
        "markup.link.url" = cyan;
        "markup.link.text" = pink;
        "markup.raw" = orange;
        "markup.quote" = {
          fg = yellow;
          modifiers = ["italic"];
        };

        "diff" = comment;
        "diff.plus" = green;
        "diff.minus" = red;
        "diff.delta" = orange;

        # user interface
        "ui.background" = background;

        "ui.linenr" = {fg = comment;};
        "ui.linenr.selected" = {fg = foreground;};

        "ui.statusline" = {
          fg = foreground;
          bg = current-line;
        };
        "ui.statusline.inactive" = {
          fg = comment;
          bg = background;
        };
        "ui.statusline.normal" = {
          fg = background;
          bg = purple;
          modifiers = ["bold"];
        };
        "ui.statusline.insert" = {
          fg = background;
          bg = green;
          modifiers = ["bold"];
        };
        "ui.statusline.select" = {
          fg = background;
          bg = orange;
          modifiers = ["bold"];
        };

        "ui.popup" = {
          fg = foreground;
          bg = current-line;
        };
        "ui.window" = {fg = foreground;};
        "ui.help" = {
          fg = foreground;
          bg = current-line;
        };

        "ui.bufferline" = {
          fg = "foreground";
          bg = background;
        };
        "ui.bufferline.active" = {
          fg = "cyan";
          background = current-line;
          underline = {
            colour = cyan;
            style = "line";
          };
        };
        "ui.bufferline.background" = {bg = background;};

        "ui.text" = foreground;
        "ui.text.focus" = {
          fg = foreground;
          bg = current-line;
          modifiers = ["bold"];
        };
        "ui.text.inactive" = {fg = comment;};

        "ui.virtual" = current-line;
        "ui.virtual.ruler" = {bg = background;};
        "ui.virtual.indent-guide" = background;
        "ui.virtual.inlay-hint" = {
          fg = comment;
          bg = current-line;
        };
        "ui.virtual.jump-label" = {
          fg = pink;
          modifiers = ["bold"];
        };

        "ui.selection" = {bg = current-line;};

        "ui.cursor" = {
          fg = background;
          bg = foreground;
        };
        "ui.cursor.primary" = {
          fg = background;
          bg = foreground;
        };
        "ui.cursor.match" = {
          fg = pink;
          modifiers = ["bold"];
        };
        "ui.cursor.primary.normal" = {
          fg = background;
          bg = purple;
        };
        "ui.cursor.primary.insert" = {
          fg = background;
          bg = green;
        };
        "ui.cursor.primary.select" = {
          fg = background;
          bg = orange;
        };

        "ui.cursorline.primary" = {bg = current-line;};

        "ui.menu" = {
          fg = foreground;
          bg = background;
        };
        "ui.menu.selected" = {
          fg = foreground;
          bg = current-line;
          modifiers = ["bold"];
        };

        "diagnostic.error" = {
          underline = {
            color = red;
            style = "curl";
          };
        };
        "diagnostic.warning" = {
          underline = {
            color = orange;
            style = "curl";
          };
        };
        "diagnostic.info" = {
          underline = {
            color = yellow;
            style = "curl";
          };
        };
        "diagnostic.hint" = {
          underline = {
            color = cyan;
            style = "curl";
          };
        };

        error = red;
        warning = orange;
        info = yellow;
        hint = cyan;
      };
    };
  };
}
