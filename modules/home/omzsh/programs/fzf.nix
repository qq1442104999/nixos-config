{ config, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true; # 是否启用 Oh-My-Zsh 插件，如果启用则不需要单独安装 fzf-tab 插件
    
    # 对应 export FZF_DEFAULT_COMMAND
    defaultCommand = "fd --type f --hidden --follow --exclude .git";

    # 对应 export FZF_DEFAULT_OPTS
    defaultOptions = [
      "--height=40%"
      "--layout=reverse"
      "--border"
      "--preview-window=right:60%:wrap"
    ];

    # 设置颜色
    colors = {
      fg      = "default";    # 普通文字
      bg      = "default";    # 背景
      header  = "cyan";       # 顶部 header
      info    = "yellow";     # 信息文字
      prompt  = "green";      # 提示符
      pointer = "red";        # 当前选中行指针
      marker  = "magenta";    # 多选标记
      spinner = "yellow";     # spinner
      fg+, bg+ = "default";   # 高亮文字/背景
    };

    # 对应 export FZF_CTRL_T_COMMAND 和 FZF_CTRL_T_OPTS
    fileWidgetCommand = "fd --hidden --follow --exclude .git";
    fileWidgetOptions = [
      "--preview '${../scripts/preview.sh} {}'"
    ];

    # 对应 export FZF_ALT_C_COMMAND
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    changeDirWidgetOptions = [
      "--preview 'eza --tree --icons=auto --color=always {} | head -200'"
    ];

    # 开启 TMUX 集成
    tmux = {
      enableShellIntegration = true;
      # 这里就是 shellIntegrationOptions
      # -p 代表 popup (弹出窗口)
      # 80%,60% 代表宽度和高度
      shellIntegrationOptions = [ "-p80%,60%" ];
    };
  };
}