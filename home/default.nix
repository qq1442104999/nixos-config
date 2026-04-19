{ pkgs, ... }:
{
  imports = [

    ../modules/home/niri/default.nix
    ../modules/home/omzsh/default.nix
    ../modules/home/noctalia-shell/default.nix

    ../modules/programs/starship.nix
    ../modules/programs/eza.nix
    ../modules/programs/fzf.nix
    ../modules/programs/zoxide.nix
    ../modules/programs/yazi.nix
    ../modules/programs/television.nix
    ../modules/programs/ghostty.nix
    ../modules/programs/tmux.nix
  ];

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