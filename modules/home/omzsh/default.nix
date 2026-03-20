{ config, pkgs, lib, ... }:

let
  sources = import ./_sources/generated.nix {
    inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
  };

  ZSH_CACHE_DIR = "${config.home.homeDirectory}/.cache/oh-my-zsh"; # 缓存目录

in
{
  imports = [
    ./starship.nix
  ];

  # ======================
  # 基础工具
  # ======================
  programs.fzf.enable = true;

  programs.zoxide.enable = true;



  # ======================
  # Zsh / Oh-My-Zsh
  # ======================
  programs.zsh = {
    enable = true;

    history = {
      path = "${ZSH_CACHE_DIR}/zsh_history";
      size = 50000;
      save = 10000;
    };

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -lh";
      la = "ls -Iah";
      vim = "nvim";
      vi = "nvim";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = sources.fzf-tab.src;
        file = "fzf-tab.plugin.zsh";
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

    #oh-my-zsh = {
    #  enable = true;
    #  theme = "robbyrussell"; # 主题由 OMZ 管理（Starship 会覆盖 prompt）
    #  plugins = [
    #    "git"
    #    "sudo"
    #    "extract"
    #    "command-not-found"
    #    "colored-man-pages"
    #    "fzf"
    #  ];
    #};

    initContent = lib.mkOrder 500 ''
      # ======================
      # 基础环境变量
      # ======================
      #mkdir -p "$ZSH_CACHE_DIR"
      #export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
      export CONFIGDIR="''${XDG_CONFIG_HOME:-$HOME/.config}"
      export LESS='-R'

      setopt GLOB_DOTS
      zstyle ':completion:*' menu no

      # ======================
      # FZF 配置
      # ======================
      export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

      export FZF_CTRL_T_OPTS="--preview '$CONFIGDIR/fzf/preview.sh {}'"
      export FZF_DEFAULT_OPTS="
        --height=40%
        --layout=reverse
        --border
        --info=inline
        --preview-window=right:60%
      "

      zstyle ':fzf-tab:*' fzf-command fzf
      export FZF_TAB_CUSTOM_PREVIEW="$CONFIGDIR/fzf/preview.sh {}"

      # ======================
      # 工具初始化
      # ======================
      #eval "$(zoxide init zsh)"
      #eval "$(starship init zsh)"

      # --------------------------
      # 自动跳回上次目录
      # --------------------------
      _apply_chpwd_hook() {
          chpwd_hook() { echo $PWD > "${ZSH_CACHE_DIR}/currentdir" }
          autoload -Uz add-zsh-hook
          add-zsh-hook -Uz chpwd chpwd_hook
          if [[ -f "${ZSH_CACHE_DIR}/currentdir" ]]; then
              local currentdir
              currentdir=$(cat "${ZSH_CACHE_DIR}/currentdir")
              [[ -d "$currentdir" ]] && cd "$currentdir"
          fi
      }
      _apply_chpwd_hook

    '';
  };

  # ======================
  # 软件包
  # ======================
  home.packages = with pkgs; [
    file
    fd
    fzf
    lesspipe
    starship
    zoxide

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
    LESSOPEN  = "|${config.home.homeDirectory}/.config/lessfilter %s";
  };

  # ======================
  # 使用外部 lessfilter 文件
  # ======================
  home.file.".config/lessfilter".source = ./scripts/lessfilter;

  home.file.".config/fzf/preview.sh".source = ./scripts/preview.sh;
}
