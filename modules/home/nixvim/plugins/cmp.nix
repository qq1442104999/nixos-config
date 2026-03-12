{ config, pkgs, ... }:
{
  plugins.cmp = {
    enable = true;
    settings = {
      mapping = {
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "buffer"; }
        { name = "path"; }
      ];
    };

    cmdline = {
      search = {
        view = {
          entries = {
            name = "native";
            selection_order = "top_down";
          };
        };
      };
      command = {
        view = {
          entries = {
            name = "wildmenu";
            selection_order = "bottom_up";
          };
        };
      };
    };  
  };
}
