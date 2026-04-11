local oil_opt = {
  hide_dotgit = true,
  hide_dotdot = true,
  ignore_files_order = { ".neotreeignore", ".ignore" },
}

-- Get toplevel of git repo or nil
local function get_toplevel(dir)
  local proc = vim.system({
    "git",
    "rev-parse",
    "--show-toplevel",
  }, { cwd = dir, text = true })
  local result = proc:wait()

  if result.code ~= 0 then
    return nil
  end

  return vim.trim(result.stdout)
end

local function parse_output(proc)
  local result = proc:wait()
  local files = {}

  if result.code ~= 0 then
    return files
  end

  for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
    local f = line:find("/")
    -- Getting rid of "dir/file"
    if f == nil or f == line:len() then
      -- Remove trailing "/"
      files[line:gsub("/$", "")] = true
    end
  end

  return files
end

local function get_ignored_files(dir)
  local ignored_files = {}
  local toplevel = get_toplevel(dir)

  if toplevel == nil then
    return ignored_files
  end

  for _, name in ipairs(oil_opt.ignore_files_order) do
    local fullpath = toplevel .. "/" .. name

    if vim.uv.fs_stat(fullpath) then
      local ignored_files_proc = vim.system({
        "git",
        "ls-files",
        "-ico",
        "--directory",
        "--exclude-from",
        fullpath,
      }, { cwd = dir, text = true })

      return parse_output(ignored_files_proc)
    end
  end

  return ignored_files
end

local function new_ignore_status()
  return setmetatable({}, {
    __index = function(self, dir)
      local ignored_files = get_ignored_files(dir)
      rawset(self, dir, ignored_files)
      return ignored_files
    end,
  })
end
local ignore_status = new_ignore_status()

local refresh = require("oil.actions").refresh
local orig_refresh = refresh.callback
refresh.callback = function(...)
  ignore_status = new_ignore_status()
  orig_refresh(...)
end

require("oil").setup({
  default_file_explorer = true,

  columns = {
    "icon",
    "permissions",
  },

  win_options = {},

  keymaps = {
    ["-"] = false,
    ["<C-k>"] = "actions.parent",
    ["<CR>"] = false,
    ["<C-j>"] = "actions.select",
  },

  view_options = {
    is_hidden_file = function(name, bufnr)
      if oil_opt.hide_dotgit and name == ".git" then
        return true
      end

      local dir = require("oil").get_current_dir(bufnr)

      if not dir then
        return false
      end

      return ignore_status[dir][name] or false
    end,
    is_always_hidden = function(name)
      if oil_opt.hide_dotdot and name == ".." then
        return true
      end
    end,
  },
})
