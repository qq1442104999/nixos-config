{ config, ... }:
{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto"; # 需要你的终端安装了 Nerd Font
  };
}