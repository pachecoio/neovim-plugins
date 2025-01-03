return {
  -- {
  --   "vim-test/vim-test",
  --   url = "https://github.com/pachecoio/vim-test",
  --   lazy = false,
  --   config = function()
  --     -- vim.g['test#preserve_screen'] = false
  --
  --     local set_test_runner = function(lang, runner)
  --       vim.cmd(string.format("let g:test#%s#runner = '%s'", lang, runner))
  --     end
  --
  --     set_test_runner("javascript", "jest")
  --     set_test_runner("typescript", "jest")
  --     -- set_test_runner('python', 'pytest')
  --
  --     -- remaps
  --     vim.cmd [[nnoremap <leader>tt :TestNearest<cr>]]
  --     vim.cmd [[nnoremap <leader>tf :TestFile<cr>]]
  --     vim.cmd [[nnoremap <leader>tl :TestLast<cr>]]
  --     vim.cmd [[nnoremap <leader>ts :TestSuite<cr>]]
  --     vim.cmd [[nnoremap <leader>tc :TestClass<cr>]]
  --     vim.cmd [[nnoremap <leader>tv :TestVisit<cr>]]
  --
  --     -- local set_reactscript_test_runner = function()
  --     --   set_test_runner('javascript', 'reactscripts')
  --     --   set_test_runner('typescript', 'reactscripts')
  --     -- end
  --     --
  --     -- local set_jest_test_runner = function()
  --     --   set_test_runner('javascript', 'jest')
  --     --   set_test_runner('typescript', 'jest')
  --     -- end
  --
  --     -- set map to change test runner using the utility function
  --     -- vim.keymap.set('n', '<leader>trr', set_reactscript_test_runner, { desc = 'Set reactscripts as testrunner' })
  --     --
  --     -- vim.keymap.set('n', '<leader>trj', set_jest_test_runner, { desc = 'Set jest as testrunner' })
  --
  --     -- set_test_runner('javascript', 'vitest')
  --   end,
  -- },

  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  -- },

  {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-plenary",
      "MarkEmmons/neotest-deno",
      "jfpedroza/neotest-elixir"
      {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
      },
      -- "mrcjkb/neotest-haskell",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local neotest = require "neotest"
      neotest.setup {
        adapters = {
          require "neotest-plenary",
          require "neotest-python",
          require "neotest-go",
          require "neotest-deno",
          require "neotest-jest",
          require "rustaceanvim.neotest",
          require "neotest-elixir",
          -- require "neotest-haskell" {
          --   -- Default: Use stack if possible and then try cabal
          --   build_tools = { "stack", "cabal" },
          --   -- Default: Check for tasty first and then try hspec
          --   frameworks = { "tasty", "hspec", "sydtest" },
          -- },
        },
      }

      local test_file = function()
        vim.cmd [[w]]
        neotest.run.run(vim.fn.expand "%")
      end

      local test_suite = function()
        vim.cmd [[w]]
        neotest.run.run(vim.fn.expand "%:p:h")
        vim.cmd [[Neotest output-panel]]
        vim.cmd "wincmd j"
        vim.cmd "normal G"
      end

      local toggle_float_output = function()
        if vim.api.nvim_win_get_config(0).relative ~= "" then vim.cmd "wincmd p" end
      end

      local map = vim.keymap.set

      map("n", "<leader>tt", ":w<cr>:Neotest run<cr>", { desc = "Neotest" })
      map("n", "<leader>tf", test_file, { desc = "Neotest file" })
      map("n", "<leader>ts", test_suite, { desc = "Neotest suite" })
      map("n", "<leader>tk", toggle_float_output, { desc = "Toggle float output" })
    end,
  },
}
