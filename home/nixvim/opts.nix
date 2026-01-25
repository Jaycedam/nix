{ pkgs, ... }:
{
  opts = {
    number = true;
    shell = "${pkgs.fish}/bin/fish";
    relativenumber = true;
    winborder = "rounded";
    cursorline = true;
    termguicolors = true;
    scrolloff = 10;
    ignorecase = true;
    smartcase = true;
    breakindent = true;
    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    confirm = true;
    splitright = true;
    splitbelow = true;
    signcolumn = "yes";
    title = true;
    titlestring.__raw = "[[%{v:progname} - %t %m]]";
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];
  };
}
