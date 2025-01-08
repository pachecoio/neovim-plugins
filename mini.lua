return {
  {
    'echasnovski/mini.ai',
    version = false,
    event = "BufRead",
    config = function()
      local miniai = require('mini.ai')
      miniai.setup {}
    end
  },
}
