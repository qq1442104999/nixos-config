{ ... }:

{
  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # 自动创建文件夹
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null; # 禁用桌面文件夹（如果你不喜欢桌面上放东西）
  };
  
  xdg.mime.enable = true;

  # 定义文件类型与程序的关联
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "terminal" = [ "ghostty.desktop" ];
    };
  };
  
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "ghostty.desktop" ];
    };
  };
}