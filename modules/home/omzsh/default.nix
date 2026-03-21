{ config, pkgs, lib, ... }:

let
  # 引入第三方插件源
  sources = import ./_sources/generated.nix {
    inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
  };

  ZSH_CACHE_DIR = "${config.home.homeDirectory}/.cache/oh-my-zsh"; # 缓存目录

in
{
  imports = [
    ./programs/starship.nix
    ./programs/eza.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
  ];

  # ======================
  # 基础工具
  # ======================
  #programs.fzf.enable = true;

  #programs.zoxide.enable = true;



  # ======================
  # Zsh / Oh-My-Zsh
  # ======================
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    history = {
      path = "${ZSH_CACHE_DIR}/zsh_history";
      size = 50000;
      save = 10000;
    };

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

    setOptions = [
      "GLOB_DOTS"
      "AUTO_PUSHD"
      "PUSHD_IGNORE_DUPS"
      "PUSHDMINUS"
      "EXTENDED_HISTORY"
      "HIST_EXPIRE_DUPS_FIRST"
      "HIST_IGNORE_DUPS"
      "HIST_IGNORE_SPACE"
      "HIST_VERIFY"
      "INC_APPEND_HISTORY"
      "SHARE_HISTORY"
      "AUTO_CD"
      "MULTIOS"
      "PROMPT_SUBST"
      "NO_CORRECT"
    ];

    # ----------------------
    # initExtra 拆块
    # ----------------------
    initContent = lib.mkOrder 1000 ''
      # ========= 环境变量 =========
      export LESS='-R'
      SHORT_HOST=''${HOST/.*/}
      zstyle ':completion:*' menu no
      autoload -Uz add-zsh-hook
      zmodload -i zsh/complist
      autoload -U colors && colors

      #unsetopt correct
      #setopt GLOB_DOTS

      #setopt auto_pushd
      #setopt pushd_ignore_dups
      #setopt pushdminus

      #setopt extended_history
      #setopt hist_expire_dups_first
      #setopt hist_ignore_dups
      #setopt hist_ignore_space
      #setopt hist_verify
      #setopt inc_append_history
      #setopt share_history

      #setopt auto_cd
      #setopt multios
      #setopt prompt_subst

      # ========= 自定义函数 =========
      function d () {
        if [[ -n $1 ]]; then
          dirs "$@"
        else
          dirs -v | head -10
        fi
      }
      compdef _dirs d

      # ========= OMZ zle 初始化 smkx/rmkx =========
      if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
        function zle-line-init() {
          echoti smkx
        }
        function zle-line-finish() {
          echoti rmkx
        }
        zle -N zle-line-init
        zle -N zle-line-finish
      fi

      # ========= 快捷键绑定 =========
      _apply_keybindings() {
        bindkey -e                                            # Use emacs key bindings
        bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
        if [[ "''${terminfo[kpp]}" != "" ]]; then
          bindkey "''${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
        fi
        if [[ "''${terminfo[knp]}" != "" ]]; then
          bindkey "''${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
        fi
        if [[ "''${terminfo[kcuu1]}" != "" ]]; then
          autoload -U up-line-or-beginning-search
          zle -N up-line-or-beginning-search
          bindkey "''${terminfo[kcuu1]}" up-line-or-beginning-search
        fi
        if [[ "''${terminfo[kcud1]}" != "" ]]; then
          autoload -U down-line-or-beginning-search
          zle -N down-line-or-beginning-search
          bindkey "''${terminfo[kcud1]}" down-line-or-beginning-search
        fi
        if [[ "''${terminfo[khome]}" != "" ]]; then
          bindkey "''${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
        fi
        if [[ "''${terminfo[kend]}" != "" ]]; then
          bindkey "''${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
        fi
        bindkey ' ' magic-space                               # [Space] - do history expansion
        bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
        bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
        if [[ "''${terminfo[kcbt]}" != "" ]]; then
          bindkey "''${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
        fi
        bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
        if [[ "''${terminfo[kdch1]}" != "" ]]; then
          bindkey "''${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
        else
          bindkey "^[[3~" delete-char
          bindkey "^[3;5~" delete-char
          bindkey "\e[3~" delete-char
        fi
        }
      _apply_keybindings

      # ========= FZF-Tab 自定义预览 =========
      #export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
      #export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      #export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

      #export FZF_CTRL_T_OPTS="--preview '${./scripts/preview.sh} {}'"
      #export FZF_DEFAULT_OPTS="
      #  --height=40%
      #  --layout=reverse
      #  --border
      #  --info=inline
      #  --preview-window=right:60%
      #"

      zstyle ':fzf-tab:*' fzf-command fzf
      export FZF_TAB_CUSTOM_PREVIEW="${./scripts/preview.sh} {}"

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
