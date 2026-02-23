{ inputs, ... }:
{
  # NOTE: nvim-tree.lua and snacks.nvim are lack of ignore file options
  # https://github.com/nvim-tree/nvim-tree.lua/issues/2367
  # https://github.com/folke/snacks.nvim/issues/2736
  # I am not looking at neo-tree because I doesn't use 90% of it
  # So only oil.nvim left, it doesn't have builtin option, but easy to setup
  # TODO: Check 3rd party extensions
  # TODO: Tweak options
  config.vim.utility.oil-nvim.enable = true;
  config.vim.luaConfigRC.oil-nvim-setup = builtins.readFile ../plugin/oil.nvim/init.lua;
}
