local colors = {}
colors.variants = {
  [1] = "midnight",
  [2] = "twilight",
  [3] = "night",
  [4] = "fullmoon",
  [5] = "quasar",
  [6] = "nova",
  [7] = "kv",
}

---Check for the existence of a variant in the variant table
--@param val string: variant to search for
--@return exists boolean: boolean value with the search response
local function variant_exists(val)
  val = val or ""
  local index = vim.fn.index(colors.variants, val)
  local exists = index >= 0 and true or false
  return exists, (index + 1)
end

---Select variant color and return it
--@param variant string: name of the selected color variant
--@return scheme table: editor elements with its respective colors
function colors.get_scheme(variant)
  variant = variant or ""
  local exists, index = variant_exists(variant)
  local scheme = {}

  if exists then
    scheme = require(string.format("nebulous.colors.%s", variant))
    vim.g.nebulous_variant_loaded = index
  else
    print(string.format(
      "[Nebulous] The variant '%s' does not exists. Default variant was set.",
      variant))
    scheme = require("nebulous.colors.night")
    vim.g.nebulous_variant_loaded = 3
  end
  scheme.none = "NONE"

  return scheme
end

return colors
