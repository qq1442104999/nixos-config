{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;

    settings = {

      prefer-no-csd = true;

      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
        };
      };

      binds = {
        "Ctrl+Return".action.spawn = "kitty";

        "Ctrl+D".action.spawn = "fuzzel";
      };

      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        {
          command = [ "mako" ];
        }
      ];
    };
  };

  home.packages = with pkgs; [
    kitty
    mako
    fuzzel
  ];
}