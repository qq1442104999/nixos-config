{ config, pkgs, lib, ... }:

let
  # ======================
  # 第三方 Zsh 插件
  # ======================
  fzfTab = pkgs.fetchFromGitHub {
    owner = "Aloxaf";
    repo = "fzf-tab";
    rev = "747c15de85a38748b28c29ac65616137dbb4c8b6";
    hash = "sha256-gatFp2kjyqaqi8hu0UWPDtQAy+X2VmyYNPP4aiNDdHg=";
  };

  fzfTabSource = pkgs.fetchFromGitHub {
    owner = "Freed-Wu";
    repo = "fzf-tab-source";
    rev = "5463698036f5e23ef275b4b55c42551879ebfab4";
    hash = "sha256-ar025RTlDFWEnE9Ql8WBz4tiBmz1B2tsZiRI2/mVCDI=";
  };

  zshAutosuggestions = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-autosuggestions";
    rev = "85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5";
    hash = "sha256-KmkXgK1J6iAyb1FtF/gOa0adUnh1pgFsgQOUnNngBaE=";
  };

  zshSyntaxHighlighting = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "1d85c692615a25fe2293bdd44b34c217d5d2bf04";
    hash = "sha256-VMne38IQwqB4jwGUI2f3eEiSkT2ww7+G5ch7w+65GT0=";
  };

  ZSH_PLUGINS_DIR = "${config.home.homeDirectory}/nixos/modules/home/omzsh/plugins"; # 你本地插件目录
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
      # Zsh 插件（顺序很重要）
      # ======================
      source ${fzfTab}/fzf-tab.plugin.zsh
      source ${fzfTabSource}/fzf-tab-source.plugin.zsh
      source ${zshAutosuggestions}/zsh-autosuggestions.plugin.zsh
      source ${zshSyntaxHighlighting}/zsh-syntax-highlighting.zsh
      source "${ZSH_PLUGINS_DIR}/colored-man-pages/colored-man-pages.plugin.zsh"
      source "${ZSH_PLUGINS_DIR}/extract/extract.plugin.zsh"
      source "${ZSH_PLUGINS_DIR}/sudo/sudo.plugin.zsh"

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
