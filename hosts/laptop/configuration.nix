{ config, lib, pkgs, inputs, ... }:

{
  # ==================================================
  # 导入模块
  # ==================================================
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
    ./hardware.nix

    inputs.home-manager.nixosModules.home-manager  # <-- 系统级 Home Manager 模块
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.wang = import ../../home/laptop/home.nix;
      };
    }

    ../../modules/nixos/system/fonts.nix
    ../../modules/nixos/system/users.nix
    ../../modules/nixos/system/audio.nix

    ../../modules/nixos/desktop/niri.nix
  ];

  # ==================================================
  # 系统基本信息
  # ==================================================
  networking.hostName = "nixos";      # 主机名
  time.timeZone = "Asia/Shanghai";    # 时区

  # ==================================================
  # 系统启动（Bootloader）
  # ==================================================
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ==================================================
  # 网络
  # ==================================================
  networking.networkmanager.enable = true;   # 使用 NetworkManager 管理网络

  networking.networkmanager.ensureProfiles.profiles = {
    "H3C_A96AFE_5G" = {
      connection = {
        id = "H3C_A96AFE_5G";
        type = "wifi";
        autoconnect = true;
        interface-name = "wlp0s20f3";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "H3C_A96AFE_5G";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "80808080"; # 你的密码
      };
      ipv4 = {
        method = "auto";
      };
    };
  };

  # ==================================================
  # 电源管理
  # ==================================================
  services.power-profiles-daemon.enable = true; # 电源模式管理（performance/balanced/powersave）

  # ==================================================
  # 系统语言与本地化
  # ==================================================
  i18n.defaultLocale = "zh_CN.UTF-8";         # 系统默认语言

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT    = "zh_CN.UTF-8";
    LC_MONETARY       = "zh_CN.UTF-8";
    LC_NAME           = "zh_CN.UTF-8";
    LC_NUMERIC        = "zh_CN.UTF-8";
    LC_PAPER          = "zh_CN.UTF-8";
    LC_TELEPHONE      = "zh_CN.UTF-8";
    LC_TIME           = "zh_CN.UTF-8";
  };

  # ==================================================
  # 键盘布局
  # ==================================================
  services.xserver.xkb = {
    layout  = "us";    # 键盘布局
    variant = "";
  };

  # ==================================================
  # Shell 环境
  # ==================================================
  programs.zsh.enable = true;   # 启用 Zsh

  # 允许运行未打包的二进制程序（如 AppImage / 手动下载软件）
  programs.nix-ld.enable = true;


  # ==================================================
  # 系统服务
  # ==================================================
  services.openssh.enable = true;  # SSH 远程登录

  services.openssh.settings.PasswordAuthentication = true;

  # ==================================================
  # 系统软件
  # ==================================================
  environment.systemPackages = with pkgs; [

    # 基础工具
    wget
    git
    file

    # shell
    zsh

    # 剪贴板
    xclip

    # nix 开发工具
    nix-prefetch-scripts
  ];

  # ==================================================
  # 环境变量
  # ==================================================
  environment.variables = {
    TERM = "xterm-256color";
    CLIPBOARD = "wl-copy";
  };

  # ==================================================
  # Nix 配置
  # ==================================================
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    max-jobs = "auto";
  };

  # ==================================================
  # 系统状态版本
  # ==================================================
  system.stateVersion = "25.11";
}