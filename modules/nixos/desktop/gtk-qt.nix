{ pkgs, ... }:

{
  # 1. 安装必要的包
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];

  # 2. 使用 NixOS 官方 Qt 配置模块（它会自动帮你设好环境变量）
  qt = {
    enable = true;
    platformTheme = "qt5ct"; # 这会自动处理 qt5ct 和 qt6ct 的映射
    style = "kvantum";
  };

  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_X11_NO_MITSHM = "1";
    NIXOS_OZONE_WL = "1";
    #QT_QPA_PLATFORM = "wayland;xcb";
  };

  # 3. 确保没有手动定义冲突的变量
  # 检查你的 configuration.nix 或 home.nix，删掉手动设置的：
  # QT_STYLE_OVERRIDE = "kvantum"; 
  # QT_QPA_PLATFORMTHEME = "qtct";
}