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
  };
}
