local M = {}

---Default scheme options
M.scheme_options = {
  variant = "night",
  disable = {
    background = false,
    endOfBuffer = true,
  },
  italic = {
    comments   = false,
    keywords   = false,
    functions  = false,
    variables  = false,
  },
  custom_colors = {}
}

---Set custom options to the editor
--@parama opts table: custom options for editor
function M.set_options(opts)
  local options = opts or {}
  if type(options) == "table" then
    local new_sets =
      vim.tbl_deep_extend("force", {}, M.scheme_options, options)
    M.scheme_options = new_sets
  end
end

---Get the value of secheme options
--@param tab table: custom options to be applied to the editor scheme
--@returns settings table: settings adapted to load the scheme
function M.get_options()
  local settings = {} --TODO: improve options adaptation
  local opts = M.scheme_options

  settings.st_eof        = opts.disable.endOfBuffer
  settings.st_disable_bg = opts.disable.background  and "NONE"
  settings.st_comments   = opts.italic.comments     and "italic" or "NONE"
  settings.st_keywords   = opts.italic.keywords     and "italic" or "NONE"
  settings.st_functions  = opts.italic.functions    and "italic" or "NONE"
  settings.st_variables  = opts.italic.variables    and "italic" or "NONE"

  return settings
end

return M
