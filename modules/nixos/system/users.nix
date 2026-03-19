{ config, pkgs, ... }:
{
  users.users.wang = {
    isNormalUser = true;        # 普通用户
    description  = "wang";
    password = "wanglei";

    extraGroups = [
      "wheel"           # sudo 权限
      "networkmanager"  # 网络管理
      "video"
      "input"
      "seat"
    ];

    shell = pkgs.zsh;           # 默认 shell

    packages = with pkgs; [ ];  # 用户额外软件

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFqRG9H1jn9pzl6IitwGDNcVDxe+oXql6yuezTFyv35 administrator@USER-20211220FH"
    ];
  };
}