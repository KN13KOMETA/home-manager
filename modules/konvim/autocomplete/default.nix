{ inputs, ... }:
{
  # NOTE: For now I am sticking with nvim-cmp, maybe check blink.cmp later
  config.vim.autocomplete.nvim-cmp = {
    enable = true;
    # NOTE: cmp-nvim-lsp turned on automatically
    sourcePlugins = [
      "cmp-path"
    ];
    sources = {
      path = "[Path]";
    };
  };
}
