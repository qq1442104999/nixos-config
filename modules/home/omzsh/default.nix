{ config, pkgs, lib, ... }:

let
  # 引入第三方插件源
  sources = import ../../_sources/generated.nix {
    inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
  };

  ZSH_CACHE_DIR = "${config.home.homeDirectory}/.cache/oh-my-zsh"; # 缓存目录

in
{
  # ======================
  # Zsh / Oh-My-Zsh
  # ======================
  programs.zsh = {
    enable = true;

    enableCompletion = false;
    
    dotDir = "${config.xdg.configHome}/zsh";

    shellAliases = {
      grep = "grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}";
    };

    # ----------------------
    # 插件声明式加载
    # ----------------------
    plugins = [
      {
        name = "fzf-tab";
        src = sources.fzf-tab.src;
        file = "fzf-tab.plugin.zsh";
      }
      {
        name= "fzf-tab-source";
        src = sources.fzf-tab-source.src;
        file = "fzf-tab-source.plugin.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = sources.zsh-autosuggestions.src;
        file = "zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = sources.zsh-syntax-highlighting.src;
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "colored-man-pages";
        src = ./plugins/colored-man-pages;
        file = "colored-man-pages.plugin.zsh";
      }
      {
        name = "extract";
        src = ./plugins/extract;
        file = "extract.plugin.zsh";
      }
      {
        name = "sudo";
        src = ./plugins/sudo;
        file = "sudo.plugin.zsh";
      }
    ];

    initContent = lib.mkMerge [
      (lib.mkOrder 500 ''
        #zmodload zsh/zprof
        export ZSH_DISABLE_COMPFIX=true
        export ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump"
        autoload -Uz compinit
        compinit -d "$ZSH_COMPDUMP" -C
      '')
      (lib.mkOrder 1000 (
        builtins.readFile (
          pkgs.replaceVars ./scripts/my_initContent.zsh{
            ZSH_CACHE_DIR = "${config.home.homeDirectory}/.cache/oh-my-zsh";
          }
        )
      ))
      (lib.mkOrder 1500 ''
        #zprof
      '')
    ];

  };

  # ======================
  # 软件包
  # ======================
  home.packages = with pkgs; [
    lesspipe
    file        # CLI 文件浏览器
    fd          # CLI 文件搜索工具
    ripgrep     # CLI rg搜索工具
    tree        # 文件树工具

    python3Packages.pandas
    python3Packages.plotext
    python3Packages.tensorboard
    python3Packages.lmdb
    python3Packages.torch

    jq
    bat
    eza
    chafa
    exiftool
    poppler
    python3Packages.pygments
  ];

  # ======================
  # Session 环境变量
  # ======================
  home.sessionVariables = {
    LESSOPEN  = "|${./scripts/lessfilter} %s";
  };
}
