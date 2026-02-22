{ inputs, runtime-path, ... }:
{
  config.vim = {
    additionalRuntimePaths = [ runtime-path ];

    # SPELL SETUP
    # NOTE: Disable `spellfile.vim`, we manage spell files with flakes instead
    luaConfigRC.disable-spellfile-plugin = "vim.g.loaded_spellfile_plugin = 1";
    spellcheck = {
      enable = true;
      languages = [
        "en"
        "ru"
      ];
    };

    # FILE EXPLORER SETUP
    # NOTE: nvim-tree.lua and snacks.nvim are lack of ignore file options
    # https://github.com/nvim-tree/nvim-tree.lua/issues/2367
    # https://github.com/folke/snacks.nvim/issues/2736
    # I am not looking at neo-tree because I doesn't use 90% of it
    # So only oil.nvim left, it doesn't have builtin option, but easy to setup
    # TODO: Check 3rd party extensions
    # TODO: Tweak options
    utility.oil-nvim.enable = true;
    luaConfigRC.oil-nvim-setup = builtins.readFile ./oil.nvim/init.lua;

    # TODO: theme
    theme = {
      enable = true;
      transparent = true;
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    utility.snacks-nvim = import ./snacks-nvim { inherit inputs; };

    options = {
      # TODO: sort this
      cursorlineopt = "number";

      mouse = "a";

      shiftwidth = 0;
      tabstop = 2;

      # TODO: dynamic wrap
      wrap = false;

      cursorline = true;

      ignorecase = true;
      smartcase = true;

      guifont = "IntoneMono NF:h11.2";
    };
  };
}
