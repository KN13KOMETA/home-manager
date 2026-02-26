{ inputs, fconf, ... }:
{
  vim.extraPlugins.heirline-nvim = {
    package = fconf.pkgs.vimPlugins.heirline-nvim;
    setup = builtins.readFile ./init.lua;
  };
}
