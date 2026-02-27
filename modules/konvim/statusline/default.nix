{ inputs, fconf, ... }:
{
  config.vim.options = {
    cmdheight = 0;
    laststatus = 3;
    showcmd = false;
    showmode = false;
  };
  config.vim.extraPlugins.heirline-nvim = {
    package = fconf.pkgs.vimPlugins.heirline-nvim;
    setup = builtins.readFile ./init.lua;
  };
}
