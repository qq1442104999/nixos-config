{ ... }:
  programs.vscode = {
    enable = true;
  
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
    ];
  };
}