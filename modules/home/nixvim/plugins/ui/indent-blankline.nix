{ config, pkgs, ... }:
{
  plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        debounce = 100;
        indent = {
          char = "│";
        };
        scope = {
          enabled = true;
          show_start = true;
          show_end = false;
          #highlight = [ 
          #  "Function"
          #  "Label"
          #];
        };
      };
    extraConfig = ''
      local highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      hooks.register(
          hooks.type.SCOPE_HIGHLIGHT,
          hooks.builtin.scope_highlight_from_extmark
      )
      vim.g.rainbow_delimiters = { highlight = highlight }
    '';
    };
  };
}