{ ... }: 
{
  networking.networkmanager.enable = true;
  
  # 这里建议只写通用 NM 配置，具体的 Wi-Fi Profile 可以留在 host 级
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  users.users.wang.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFqRG9H1jn9pzl6IitwGDNcVDxe+oXql6yuezTFyv35 administrator@USER-20211220FH" # 这里粘贴你的公钥字符串
  ];
}
