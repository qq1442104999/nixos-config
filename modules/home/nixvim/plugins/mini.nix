{ config, pkgs, ... }:
{
  plugins = {
    mini-icons.enable = true;
    mini-icons.mockDevIcons = true;
    
    mini-indentscope.enable = true;
    #mini-notify.enable = true;
  };
}