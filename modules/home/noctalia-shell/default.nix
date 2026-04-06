{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  programs.noctalia-shell.enable = true;

  #xdg.configFile."noctalia/settings.json".source =
  #  config.lib.file.mkOutOfStoreSymlink 
  #    "${toString ./settings.json}";

  xdg.configFile."noctalia/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink 
      "${config.home.homeDirectory}/nixos/modules/home/noctalia-shell/settings.json";
}