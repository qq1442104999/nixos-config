{ pkgs, ... }:
{
  # 1. 安装必要的包
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    nwg-look
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
   enable = true;
   platformTheme = "gtk"; # 这会自动处理 qt5ct 和 qt6ct 的映射
  #  style = "kvantum";
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ]; # 选择你喜欢的点缀色
        size = "standard";
        variant = "mocha";
      };
      name = "catppuccin-mocha-lavender-standard";
    };
  };

  #environment.variables = {
  #  QT_QPA_PLATFORM = "wayland";
  #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #  QT_X11_NO_MITSHM = "1";
  #  NIXOS_OZONE_WL = "1";
  #};
}