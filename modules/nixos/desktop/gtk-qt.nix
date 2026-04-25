{ pkgs, ... }:

{
  # 1. 安装必要的包
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    nwg-look
  ];

  qt = {
   enable = true;
  #  platformTheme = "gtk"; # 这会自动处理 qt5ct 和 qt6ct 的映射
  #  style = "kvantum";
  };

  gtk = {
    enable = true;
    # font = {
      # name = "Source Han Sans SC";
      # size = 14; # 这里设置全局 GTK 字号
    };
  };

  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_X11_NO_MITSHM = "1";
    NIXOS_OZONE_WL = "1";
  };
}