{ config, pkgs, ... }:
{
  plugins = {    
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
        ensure_installed = [
          "nix"
          "lua"
          "bash"
          "json"
        ];
      };
    };

    rainbow-delimiters = {
      enable = true;
    };
  };
}
