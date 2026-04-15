{ pkgs, ... }:
{
  imports = [

    # Niri 桌面配置
    ../modules/home/niri/default.nix

    # Oh-My-Zsh 配置
    ../modules/home/omzsh/default.nix

    # NixVim（Neovim Nix 配置）
    # ../modules/home/nixvim/default.nix

    # Noctalia Shell 配置
    ../modules/home/noctalia-shell/default.nix
    
    # stylix 配置
    #../modules/home/stylix/default.nix
  ];

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  home.packages = with pkgs; [
    kitty       # 终端
    fastfetch   # 系统信息工具
    pciutils    # lspci 工具
    tofi        # 应用启动器

    vlc         # 视频播放器
    imagemagick # 图像处理工具
    ffmpeg      # 视频处理工具
  ];
}