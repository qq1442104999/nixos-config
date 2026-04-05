{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono  # JetBrainsMono Nerd Font
    source-han-sans            # 思源黑体
  ];

  #fonts.fontconfig.enable = true;

  #fonts.fontconfig.defaultFonts = {
  #  monospace = [ "JetBrainsMono Nerd Font" "Source Han Sans SC" ];
  #  sansSerif = [ "Source Han Sans SC" ];
  #  serif     = [ "Source Han Sans SC" ];
  #};
}