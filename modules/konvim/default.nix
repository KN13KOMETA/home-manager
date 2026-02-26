{ inputs, runtime-path, ... }:
[
  (import ./spell { inherit inputs; })
  (import ./languages { inherit inputs; })
  (import ./autocomplete { inherit inputs; })

  (import ./fileexplorer { inherit inputs; })
  {
    config.vim = {
      additionalRuntimePaths = [ runtime-path ];

      fzf-lua.enable = true;

      # TODO: augroups
      # TODO: autocmds
      # TODO: binds
      # TODO: comments
      # TODO: diagnostics
      # TODO: extraPlugins
      # TODO: formatter
      # TODO: fzf-lua
      # TODO: gestures
      # TODO: git
      # TODO: highlight
      # TODO: keymaps
      # TODO: maps, mini, minimap
      # TODO: navigation
      # TODO: notes
      # TODO: notify
      # TODO: presence
      # TODO: projects
      # TODO: repl
      # TODO: runner
      # TODO: session
      # TODO: snippets
      # TODO: statusline, tabline?
      # TODO: telescope

      treesitter = {
        fold = true;
        context.enable = true;
      };

      # TODO: more ui, utility

      visuals.cellular-automaton.enable = false;
      visuals.fidget-nvim.enable = false;
      visuals.indent-blankline.enable = true;
      visuals.nvim-web-devicons.enable = true;
      visuals.rainbow-delimiters.enable = true;
      visuals.tiny-devicons-auto-colors.enable = false;

      # TODO: theme
      theme = {
        enable = true;
        transparent = true;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      options = {
        # TODO: sort this
        cursorlineopt = "number";

        mouse = "a";

        # TODO: Take a look at elastic tabstops https://github.com/neovim/neovim/issues/1419
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
