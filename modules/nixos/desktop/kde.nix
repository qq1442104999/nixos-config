{ pkgs, ... }: {
  # 1. 开启 X11 服务（Plasma 需要它作为基础，即使你用 Wayland）
  services.xserver.enable = true;

  # 2. 开启桌面环境 KDE Plasma
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}