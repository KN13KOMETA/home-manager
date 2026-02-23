{ inputs, runtime-path, ... }:
[
  (import ./fileexplorer { inherit inputs; })
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

      visuals.nvim-web-devicons.enable = true;

      # TODO: theme
      theme = {
        enable = true;
        transparent = true;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      utility.snacks-nvim = import ./plugin/snacks-nvim { inherit inputs; };

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
]
