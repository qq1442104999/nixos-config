{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-zh-hans
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        pkief.material-icon-theme
      ];

      userSettings = {
        "locale" = "zh-cn";
        #"workbench.colorTheme" = "Catppuccin Dark";
        "workbench.iconTheme" = "Material Icon Theme";
        #"editor.fontFamily" = "'Fira Code', 'Source Code Pro', Consolas, 'Courier New', monospace";
        "editor.fontLigatures" = true;
        #"editor.fontSize" = 14;
        "editor.lineHeight" = 22;
        "editor.tabSize" = 2;
        "editor.renderWhitespace" = "all";
        "editor.minimap.enabled" = false;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "files.autoSave" = "onFocusChange";
      };
    };
  };
}