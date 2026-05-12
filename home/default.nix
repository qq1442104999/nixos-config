{ pkgs, ... }:
{
  imports = [

    ../modules/home/niri/default.nix
    ../modules/home/omzsh/default.nix
    ../modules/home/noctalia-shell/default.nix

    # ../modules/home/desktop/gtk-qt.nix
    ../modules/home/desktop/xdg.nix
    # ../modules/home/stylix/default.nix

    ../modules/home/programs/starship.nix
    ../modules/home/programs/eza.nix
    ../modules/home/programs/fzf.nix
    ../modules/home/programs/zoxide.nix
    ../modules/home/programs/yazi.nix
    ../modules/home/programs/television.nix
    ../modules/home/programs/ghostty.nix
    ../modules/home/programs/tmux.nix
    ../modules/home/programs/vscode.nix
  ];

  home.packages = with pkgs; [
    kitty       # 终端
    fastfetch   # 系统信息工具
    pciutils    # lspci 工具
    tofi        # 应用启动器
    nvfetcher   # 插件管理工具
    vivid       # 终端配色方案生成工具

    vlc         # 视频播放器
    imagemagick # 图像处理工具
    ffmpeg      # 视频处理工具
  ];
}
