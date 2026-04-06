{ config, pkgs, inputs, lib, ... }:

{
  #imports = [
  #  inputs.niri.homeModules.niri
  #];

  #programs.niri = {
  #  enable = true;
  #};

  home.file.".config/niri/config.kdl".source = 
    config.lib.file.mkOutOfStoreSymlink 
      "/home/wang/nixos/modules/home/niri/config.kdl";

      # 使用 home.file 并强制覆盖
  #home.file.".config/niri/config.kdl" = {
  #  source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink 
  #    "${config.home.homeDirectory}/nixos/modules/home/niri/config.kdl");
  #};

  home.packages = with pkgs; [
    kitty
    mako
    fuzzel
  ];
}