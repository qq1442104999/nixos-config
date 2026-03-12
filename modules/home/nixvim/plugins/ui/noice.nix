{ config, pkgs, ... }:
{
  plugins = {
    noice = {
      enable = true;
      opts = {
        cmdline = { enabled = true; };
        messages = { enabled = true; };
        popupmenu = { enabled = true; };
      };
    };
  };
}