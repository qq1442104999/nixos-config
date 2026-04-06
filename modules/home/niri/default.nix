{ config, pkgs, inputs, lib, ... }:

{
  #imports = [
  #  inputs.niri.homeModules.niri
  #];

  #programs.niri = {
  #  enable = true;
  #};

  xdg.configFile."niri/config.kdl".source = lib.mkForce (
    config.lib.file.mkOutOfStoreSymlink 
      "${config.home.homeDirectory}/nixos/modules/home/niri/config.kdl"
  );

  #xdg.configFile."niri/config.kdl".source =
  #  config.lib.file.mkOutOfStoreSymlink 
  #    "${config.home.homeDirectory}/nixos/modules/home/niri/config.kdl";

  home.packages = with pkgs; [
    kitty
    mako
    fuzzel
  ];
}