{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;

    #settings = {
#
    #  prefer-no-csd = true;
#
    #  input = {
    #    keyboard = {
    #      xkb = {
    #        layout = "us";
    #      };
    #    };
    #  };
#
    #  binds = {
    #    "Ctrl+Return".action.spawn = "kitty";
#
    #    "Ctrl+D".action.spawn = "fuzzel";
    #  };
#
    #  spawn-at-startup = [
    #    { command = [ "noctalia-shell" ]; }
    #    {
    #      command = [ "mako" ];
    #    }
    #  ];
    #};
  };

  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink 
      "${toString niri/config.kdl}";

  home.packages = with pkgs; [
    kitty
    mako
    fuzzel
  ];
}