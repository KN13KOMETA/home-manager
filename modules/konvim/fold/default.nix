{ inputs, ... }:
{
  config.vim.ui.nvim-ufo.enable = true;
  config.vim.luaConfigRC.nvim-ufo-setup = builtins.readFile ./init.lua;
}
