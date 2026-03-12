{ config, pkgs, ... }:
{
  plugins = {    
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
      };
    };

    rainbow-delimiters = {
      enable = true;
    };
  };
}
