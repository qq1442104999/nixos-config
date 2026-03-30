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

  # ======XDG 用户目录配置=============
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true; # 自动创建文件夹
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null; # 禁用桌面文件夹（如果你不喜欢桌面上放东西）
  };
  
  xdg.mime.enable = true;
  # 定义文件类型与程序的关联
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
    };
  };

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
    pciutils
  ];
}