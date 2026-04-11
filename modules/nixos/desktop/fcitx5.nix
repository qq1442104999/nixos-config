{ ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons   # 拼音
      fcitx5-configtool       # 图形配置
      fcitx5-gtk              # GTK 支持
      fcitx5-qt               # Qt 支持
    ];
  };

  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };
}