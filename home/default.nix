{ ... }:
{
  imports = [

    # Niri 桌面配置
    ../modules/home/niri/default.nix

    # Oh-My-Zsh 配置
    ../modules/home/omzsh/default.nix

    # NixVim（Neovim Nix 配置）
    ../modules/home/nixvim/default.nix

    # Noctalia Shell 配置
    ../modules/home/noctalia-shell/default.nix
    
    # stylix 配置
    ../modules/home/stylix/default.nix
  ];
}