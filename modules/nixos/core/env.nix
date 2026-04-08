{ ... }: 
{
  environment.variables = {
    TERM = "xterm-256color";
    COLORTERM = "truecolor";
    CLIPBOARD = "wl-copy";

    QT_QPA_PLATFORMTHEME = "qtct";
    QT_QPA_PLATFORM = "wayland";
  };

  # 系统层面的 Zsh 配置
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  # 关键：链接补全文件
  environment.pathsToLink = [ "/share/zsh" ];

  programs.nix-ld.enable = true;
}