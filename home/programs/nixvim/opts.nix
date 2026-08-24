{
  hmConfig,
  pkgs,
  lib,
  ...
}: let
  border =
    if hmConfig.userSettings.theme.borderRadius == 0
    then "single"
    else "rounded";
in {
  extraConfigLua = ''
    require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })
  '';

  opts = {
    shell = "${lib.getExe pkgs.nushell}";
    showmode = false;
    number = true;
    relativenumber = true;
    scrolloff = 10;
    confirm = true;
    breakindent = true;
    splitright = true;
    splitbelow = true;
    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    winborder = border;
    pumborder = border;
    termguicolors = true;
    cursorline = true;
    laststatus = 3;
    signcolumn = "yes";
    cmdheight = 0;
    ignorecase = true;
    smartcase = true;
    swapfile = false;
    backup = false;
    undofile = true;
    fillchars.eob = " ";
  };
}
