
{ pkgs, ... }:
{
  i18n.consoleColors = [
    "1e1e2e" # 0: Black (Background)
    "f38ba8" # 1: Red
    "a6e3a1" # 2: Green
    "f9e2af" # 3: Yellow
    "89b4fa" # 4: Blue
    "f5c2e7" # 5: Magenta
    "94e2d5" # 6: Cyan
    "bac2de" # 7: White
    "585b70" # 8: Bright Black
    "f38ba8" # 9: Bright Red
    "a6e3a1" # 10: Bright Green
    "f9e2af" # 11: Bright Yellow
    "89b4fa" # 12: Bright Blue
    "f5c2e7" # 13: Bright Magenta
    "94e2d5" # 14: Bright Cyan
    "a6adc8" # 15: Bright White
  ];

  services.kmscon = {
    enable = true;
    hwRender = true;
    fonts = [{
      name = "JetBrainsMono Nerd Font"; 
      package = pkgs.nerd-fonts.jetbrains-mono;
    }];
    extraOptions = "--term xterm-256color";
  };
}