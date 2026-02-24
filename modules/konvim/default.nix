{ inputs, runtime-path, ... }:
[
  (import ./spell { inherit inputs; })
  (import ./languages { inherit inputs; })
  (import ./fileexplorer { inherit inputs; })
  {
    config.vim = {
      additionalRuntimePaths = [ runtime-path ];

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
