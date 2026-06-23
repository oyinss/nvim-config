-- Compatibility shim for `require('nvim-treesitter.query')`
-- Provides `get_query(lang, name)` by delegating to Neovim's treesitter API

local M = {}

local function read_query_file(lang, name)
  local rel = string.format("queries/%s/%s.scm", lang, name)
  local paths = vim.api.nvim_get_runtime_file(rel, true)
  for _, p in ipairs(paths) do
    local f = io.open(p, "r")
    if f then
      local content = f:read("*a")
      f:close()
      return content
    end
  end
  return nil
end

if vim.treesitter and vim.treesitter.query then
  local ts_query = vim.treesitter.query
  M.get_query = function(lang, name)
    -- try known API names
    if ts_query.get_query then
      return ts_query.get_query(lang, name)
    end
    if ts_query.get then
      return ts_query.get(lang, name)
    end
    if vim.treesitter.parse_query then
      local content = read_query_file(lang, name)
      if content then
        return vim.treesitter.parse_query(lang, content)
      end
    end
    return nil
  end
else
  -- no treesitter available — return a stub that returns nil
  M.get_query = function() return nil end
end

return M
