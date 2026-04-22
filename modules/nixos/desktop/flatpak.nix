{ config, pkgs, lib, inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;

    # 自动添加仓库
    remotes = lib.mkOptionDefault [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    # 声明式安装应用
    packages = [
      "com.github.tchx84.Flatseal"
    ];

    # 自动更新
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
