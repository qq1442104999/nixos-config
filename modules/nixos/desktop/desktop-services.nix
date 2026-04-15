{ ... }:

{
  # D-Bus 是系统通信的基础，Seahorse 是密钥管理的图形界面
  services.dbus.enable = true;
  
  # 启用 Seahorse 软件
  programs.seahorse.enable = true;

  # 强力推荐：配合 Seahorse 的后端服务
  #services.gnome.gnome-keyring.enable = true;
  
  # 允许在登录时自动解锁密钥环
  #security.pam.services.login.enableGnomeKeyring = true;

  # 可选：如果你需要管理一些网络相关的密钥，通常也会用到这个
  # services.networkmanager.enable = true; 
}
