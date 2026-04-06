{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink 
      "${config.home.homeDirectory}/nixos/home/niri/config.kdl";

  home.packages = with pkgs; [
    kitty
    mako
    fuzzel
  ];
}