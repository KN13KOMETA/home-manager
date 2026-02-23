{ inputs, ... }:
{
  # NOTE: config.vim.spellcheck is not used because it must be enabled to set languages
  # NOTE: Disable `spellfile.vim`, we manage spell files with flakes instead
  config.vim.luaConfigRC.spell-setup = ''
    vim.g.loaded_spellfile_plugin = 1
    vim.opt.spelllang = { "en", "ru" }
  '';
}
