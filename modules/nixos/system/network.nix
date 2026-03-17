{ ... }: 
{
  networking.networkmanager.enable = true;
  
  # 这里建议只写通用 NM 配置，具体的 Wi-Fi Profile 可以留在 host 级
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
}