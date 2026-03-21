{ config, pkgs, ... }:
{
  # ===============================
  # Vim 核心选项 (Neovim 编辑体验)
  # ===============================
  opts = {

    # ---------- 行号 ----------
    number = true;          # 显示绝对行号
    relativenumber = true;  # 显示相对行号（方便跳转）

    # ---------- Tab 缩进 ----------
    tabstop = 2;      # 一个 tab 显示为 2 个空格
    softtabstop = 2;  # 插入模式下 tab 仍按 2 空格计算
    shiftwidth = 2;   # 自动缩进 2 空格
    expandtab = true; # 使用空格代替 tab（现代推荐）

    # ---------- 自动缩进 ----------
    smartindent = true;  # 智能缩进（代码块自动对齐）
    breakindent = true;  # 换行后保持缩进层级

    # ---------- 搜索体验 ----------
    hlsearch = true;     # 高亮搜索结果
    incsearch = true;    # 输入时实时搜索

    ignorecase = true;   # 搜索忽略大小写
    smartcase = true;    # 如果输入大写则严格匹配

    grepprg = "rg --vimgrep";  # 使用 ripgrep 作为搜索引擎
    grepformat = "%f:%l:%c:%m";

    # ---------- 性能 ----------
    updatetime = 50;     # 缩短事件触发时间（加快 LSP + 补全）

    # ---------- 补全体验 ----------
    completeopt = [
      "menuone"   # 即使只有一个候选也显示菜单
      "noselect"  # 不自动选中第一项
      "noinsert"  # 不自动插入
    ];

    # ---------- 文件历史 ----------
    swapfile = false;    # 不使用 swap 文件
    backup = false;      # 不创建备份
    undofile = true;     # 开启持久 undo 历史
    autoread = true;     # 文件被外部修改自动刷新

    # ---------- 颜色支持 ----------
    termguicolors = true;  # 24位真彩色（主题必开 ⭐）

    # ---------- UI 体验 ----------
    signcolumn = "yes";   # 防止行号跳动

    cursorline = true;    # 高亮当前行
    guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20";  # 不同模式下的光标形状

    # ---------- 折叠系统 ----------
    foldcolumn = "0";     # 不显示折叠列
    foldlevel = 99;       # 默认不折叠
    foldlevelstart = 99;
    foldenable = true;
    foldmethod = "indent"; # 基于缩进折叠（简单稳定）

    # ---------- 滚动体验 ----------
    scrolloff = 10;       # 光标上下保持 10 行缓冲区

    # ---------- 输入延迟 ----------
    timeoutlen = 10;      # 快速键盘流用户优化（非常激进 ⭐）

    # ---------- 编码 ----------
    encoding = "utf-8";
    fileencoding = "utf-8";

    # ---------- 命令栏 ----------
    cmdheight = 0;        # 极简 UI（但可能导致消息闪烁 ⚠️）

    # ---------- 模式显示 ----------
    showmode = false;     # 因为通常有 lualine / statusline 替代

    # ---------- 窗口拆分 ----------
    splitbelow = true;
    splitright = true;

    # Show tabline always
    showtabline = 2;
    laststatus = 3; 
  };

  # ===============================
  # 性能优化
  # ===============================
  performance = {
    byteCompileLua = {
      enable = true;      # Lua 代码预编译（加快启动速度 ⭐⭐⭐）
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };

  # ===============================
  # 剪贴板集成（Wayland）
  # ===============================
  clipboard = {

    register = "unnamedplus"; # 使用系统剪贴板

    providers.wl-copy = {
      enable = true;
      package = pkgs.wl-clipboard;
    };
  };

  # ===============================
  # LSP 诊断体验
  # ===============================
  diagnostics = {

    update_in_insert = true; # 插入模式也更新诊断

    severity_sort = true;    # 按严重程度排序

    float.border = "rounded"; # 浮动窗口圆角

    jump.severity.__raw =
      "vim.diagnostic.severity.WARN";
  };
}
