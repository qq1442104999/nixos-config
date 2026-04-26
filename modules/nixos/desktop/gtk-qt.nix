{ pkgs, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";

  #  QT_QPA_PLATFORM = "wayland";
  #  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #  QT_X11_NO_MITSHM = "1";
  #  NIXOS_OZONE_WL = "1";
  };
}