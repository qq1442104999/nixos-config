
{ pkgs, ... }:
{
  console.colors = [
    "1e1e2e" # 0: Black (Base)
    "f38ba8" # 1: Red (Red)
    "a6e3a1" # 2: Green (Green)
    "f9e2af" # 3: Yellow (Yellow)
    "89b4fa" # 4: Blue (Blue)
    "cba6f7" # 5: Magenta (Mauve)
    "94e2d5" # 6: Cyan (Teal)
    "bac2de" # 7: White (Subtext1)
    "585b70" # 8: Bright Black (Surface2)
    "f38ba8" # 9: Bright Red (Red)
    "a6e3a1" # 10: Bright Green (Green)
    "f9e2af" # 11: Bright Yellow (Yellow)
    "89b4fa" # 12: Bright Blue (Blue)
    "cba6f7" # 13: Bright Magenta (Mauve)
    "94e2d5" # 14: Bright Cyan (Teal)
    "a6adc8" # 15: Bright White (Subtext0)
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