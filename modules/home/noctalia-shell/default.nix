{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  programs.noctalia-shell.enable = true;

  xdg.configFile."noctalia/settings.json".source = lib.mkForce ./settings.json;

  #xdg.configFile."noctalia/settings.json".source =
  #  config.lib.file.mkOutOfStoreSymlink 
  #    "${toString ./settings.json}";
}