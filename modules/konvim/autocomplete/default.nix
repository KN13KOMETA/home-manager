{ inputs, ... }:
{
  # NOTE: For now I am sticking with nvim-cmp, maybe check blink.cmp later
  config.vim.autocomplete.nvim-cmp = {
    enable = true;
    sourcePlugins = [
      "cmp-nvim-lsp"
      "cmp-path"
    ];
  };
}
