{ pkgs, ... }:
{
  # 1. 安装必要的包
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    nwg-look

    kdePackages.qqc2-desktop-style 
    libsForQt5.qtstyleplugins
  ];

  environment.variables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qtct";

  #  QT_QPA_PLATFORM = "wayland";
  #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #  QT_X11_NO_MITSHM = "1";
  #  NIXOS_OZONE_WL = "1";
  };
}