{ config, pkgs, inputs, ... }:

{
  # ==================================================
  # 导入 Home Manager 模块
  # ==================================================
  imports = [

    # Niri 桌面配置
    ../../modules/home/niri/default.nix

    # Oh-My-Zsh 配置
    ../../modules/home/omzsh/default.nix

    # NixVim（Neovim Nix 配置）
    ../../modules/home/nixvim/default.nix

    # Noctalia Shell 配置
    ../../modules/home/Noctalia/default.nix
  ];

  # ==================================================
  # 用户信息
  # ==================================================
  home.username = "wang";
  home.homeDirectory = "/home/wang";

  # Home Manager 状态版本（非常重要，不要随便改）
  home.stateVersion = "25.11";

  # ==================================================
  # Git
  # ==================================================
  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "wang";
        email = "1442104999@qq.com";
      };
    };
  };

  # ==================================================
  # 用户软件
  # ==================================================
  home.packages = with pkgs; [
    # 终端
    kitty

    # CLI 工具
    ripgrep
    tree
    fastfetch
  ];
}