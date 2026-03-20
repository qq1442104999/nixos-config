{ config, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    
    # 对应 export FZF_DEFAULT_COMMAND
    defaultCommand = "fd --type f --hidden --follow --exclude .git";

    # 对应 export FZF_DEFAULT_OPTS
    defaultOptions = ''
      --height=40%
      --layout=reverse
      --border
      --preview-window=right:60%:wrap
    '';

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
      enable = true;
      # 这里就是 shellIntegrationOptions
      # -p 代表 popup (弹出窗口)
      # 80%,60% 代表宽度和高度
      shellIntegrationOptions = [ "-p80%,60%" ];
    };
  };
}