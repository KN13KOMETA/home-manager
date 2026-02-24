{ inputs, ... }:
{
  config.vim.lsp = {
    enable = true;

    # TODO: make it toggleable
    formatOnSave = false;
  };

  # TODO: I don't actually use debuggers, I will look at this later
  config.vim.debugger = { };
  config.vim.languages.enableDAP = false;

  config.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    bash.enable = true;
    clang.enable = true;
    cmake.enable = true;
    css.enable = true;
    html.enable = true;
    json.enable = true;
    lua.enable = true;
    make.enable = true;
    markdown.enable = true;
    nix.enable = true;
    rust.enable = true;
    sql.enable = true;
    toml.enable = true;
    ts.enable = true;
    yaml.enable = true;
    zig.enable = true;
    # TODO: haxe, prisma
  };
}
