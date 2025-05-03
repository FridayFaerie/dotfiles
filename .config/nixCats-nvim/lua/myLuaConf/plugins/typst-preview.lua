return {
  {
    "typst-preview.nvim",
    for_cat = 'general.markdown',
    cmd = { "TypstPreview", "TypstPreviewStop", "TypstPreviewToggle", },
    -- NOTE: our on attach function defines keybinds that call telescope.
    -- so, the on_require handler will load telescope when we use those.
    on_require = { "typst-preview", },
    -- event = "",
    ft = "typst",
    keys = {
      {"<leader>tp", "<cmd>TypstPreview <CR>", mode = {"n"}, noremap = true, desc = "typst preview"},
      {"<leader>ts", "<cmd>TypstPreviewStop <CR>", mode = {"n"}, noremap = true, desc = "typst preview stop"},
      {"<leader>tt", "<cmd>TypstPreviewToggle <CR>", mode = {"n"}, noremap = true, desc = "typst preview toggle"},
    },
    -- colorscheme = "",
    -- load = function (name)
    --     vim.cmd.packadd(name)
    --     vim.cmd.packadd("telescope-fzf-native.nvim")
    --     vim.cmd.packadd("telescope-ui-select.nvim")
    -- end,
    after = function (plugin)
      require('telescope').setup {
        -- open_cmd = 'firefox %s -P typst-preview'
        open_cmd = 'qutebrowser %s'
      }

    end,
  },
}
