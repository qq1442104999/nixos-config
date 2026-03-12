{ config, pkgs, ... }:
{
  colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      integrations = {
        bufferline = true;
        treesitter = true;
        cmp = true;
        gitsigns = true;
        rainbow_delimiters = true;
        indent_blankline = true;
        notify = true;
      };
    };
  };
  
  plugins = {
    #状态栏插件
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          globalstatus = true;
        };
      };
    };

    noice = {
      enable = true;
      opts = {
        cmdline = { enabled = true; };
        messages = { enabled = true; };
        popupmenu = { enabled = true; };
      };
    };

    notify = {
      enable = true;
      settings = {
        timeout = 3000;
      };
    };

    #快捷键提示
    which-key.enable = true;

    #alpha.enable = true;

    alpha = {
      enable = true;
      theme = "dashboard";
  
      settings.layout = [
        {
          type = "padding";
          val = 4;
        }
  
        {
          type = "text";
          val = [
            " ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            " ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            " ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            " ██║╚██╗██║██║ ██╔██╗ ██║   ██║██║██║╚██╔╝██║"
            " ██║ ╚████║██║██╔╝ ██╗╚██████╔╝██║██║ ╚═╝ ██║"
            " ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═╝     ╚═╝"
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
  
        {
          type = "padding";
          val = 2;
        }
  
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "  New file";
              on_press.__raw = "function() vim.cmd('ene') end";
              opts = { shortcut = "n"; };
            }
            {
              type = "button";
              val = "  Recent files";
              on_press.__raw = "function() vim.cmd('Telescope oldfiles') end";
              opts = { shortcut = "r"; };
            }
            {
              type = "button";
              val = "  Find file";
              on_press.__raw = "function() vim.cmd('Telescope find_files') end";
              opts = { shortcut = "f"; };
            }
            {
              type = "button";
              val = "  Live grep";
              on_press.__raw = "function() vim.cmd('Telescope live_grep') end";
              opts = { shortcut = "g"; };
            }
            {
              type = "button";
              val = "󰒲  Lazy";
              on_press.__raw = "function() vim.cmd('Lazy') end";
              opts = { shortcut = "l"; };
            }
            {
              type = "button";
              val = "  Quit";
              on_press.__raw = "function() vim.cmd('qa') end";
              opts = { shortcut = "q"; };
            }
          ];
          opts = {
            spacing = 1;
          };
        }
  
        {
          type = "padding";
          val = 2;
        }
  
        {
          type = "text";
          val = "  nixvim + catppuccin mocha";
          opts = {
            position = "center";
            hl = "Comment";
          };
        }
      ];
    };
  };
}
