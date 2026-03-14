{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  # ==================================================
  # 导入模块
  # ==================================================
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"
  ];

  boot.kernelModules = [ "kvm-intel" ];

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware.cpu.intel.updateMicrocode = true;

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
  #networking.interfaces.ens18.useDHCP = true; # 网卡 DHCP

  #services.dbus.enable = true;

  #systemd.services."NetworkManager".enable = true;

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
  # 蓝牙 + 音频
  # ==================================================
  hardware.bluetooth.enable = true;          # 启用蓝牙

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
    jack.enable = true;
  };

  # 蓝牙音频支持
  services.blueman.enable = true;

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
  # 字体配置
  # ==================================================
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono  # JetBrainsMono Nerd Font
    source-han-sans            # 思源黑体
  ];

  fonts.fontconfig.enable = true;

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" "Source Han Sans" ];
    sansSerif = [ "Source Han Sans" ];
    serif     = [ "Source Han Sans" ];
  };

  # ==================================================
  # 用户账户
  # ==================================================
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

  # ==================================================
  # Shell 环境
  # ==================================================
  programs.zsh.enable = true;   # 启用 Zsh

  # 允许运行未打包的二进制程序（如 AppImage / 手动下载软件）
  programs.nix-ld.enable = true;

  # ==================================================
  # Wayland 桌面（Niri）
  # ==================================================
  programs.niri.enable = true;

  # ==================================================
  # 登录管理器（可选）
  # ==================================================
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "niri";
      user = "wang";
    };
  };

  # ==================================================
  # XDG Portal（Wayland应用支持）
  # ==================================================
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

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
    wl-clipboard

    # nix 开发工具
    nix-prefetch-scripts

    # Wayland
    niri
    xdg-desktop-portal-gtk
    xwayland-satellite
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