return {
  "ggandor/leap.nvim",
  lazy = false,
  dependencies = {
    { "tpope/vim-repeat" },
  },
  config = function()
    local leap = require("leap")
    -- leap.create_default_mappings()

    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

    -- Define equivalence classes for brackets and quotes, in addition to
    -- the default whitespace group.
    leap.opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    require("leap.user").set_repeat_keys("<enter>", "<backspace>")
  end,
}
