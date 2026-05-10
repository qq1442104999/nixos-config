{ pkgs, ... }: {
  # 1. 开启 X11 服务（Plasma 需要它作为基础，即使你用 Wayland）
  services.xserver.enable = true;

  # 2. 开启桌面环境 KDE Plasma
  services.desktopManager.plasma6.enable = true;

  # 3. 配置显示管理器（登录窗）
  # 如果你之前用的是别的（比如 greetd），可以换成 SDDM（KDE 官方推荐）
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true; # 让 SDDM 支持 Wayland 启动
}