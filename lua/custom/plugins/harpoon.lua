return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2', -- use v2 (recommended)
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local list = harpoon:list()

    harpoon:setup()

    -- Keymaps
    local map = vim.keymap.set
    map('n', '<leader>ha', function()
      list:add()
    end, { desc = '[H]arpoon [A]dd file' })

    map('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = '[H]arpoon [H] Menu' })

    map('n', '<leader>hn', function()
      list:next()
    end, { desc = '[H]arpoon [N]ext file' })

    map('n', '<leader>hp', function()
      list:prev()
    end, { desc = '[H]arpoon [P]revious file' })

    -- File navigation (1-9, 0)
    for i = 1, 9 do
      map('n', '<leader>' .. i, function()
        list:select(i)
      end, { desc = '[H]arpoon go to file ' .. i })
    end

    map('n', '<leader>0', function()
      list:select(10)
    end, { desc = '[H]arpoon go to file 10' })
  end,
}
