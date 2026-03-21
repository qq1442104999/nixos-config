{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    # 自动集成 Shell，开启后可以使用 'y' 或自定义别名进入
    enableZshIntegration = true; 
    
    # 基础设置
    settings = {
      manager = {
        show_hidden = true;      # 显示隐藏文件
        sort_by = "mtime";       # 按修改时间排序
        sort_sensitive = false;  # 忽略大小写排序
      };
    };
  };

  home.packages = with pkgs; [
    ffmpeg            # 视频支持
    p7zip             # 压缩文件支持
    poppler           # PDF 支持
    jq                # JSON 美化预览
    fd                # 文件查找
    ripgrep           # 内容搜索
    imagemagick       # 图片预览
    resvg             # SVG 渲染
  ];
}