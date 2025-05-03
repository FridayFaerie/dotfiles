-- local colorschemeName = nixCats('colorscheme')
-- if not require('nixCatsUtils').isNixCats then
--   colorschemeName = 'onedark'
-- end
-- -- Could I lazy load on colorscheme with lze?
-- -- sure. But I was going to call vim.cmd.colorscheme() during startup anyway
-- -- this is just an example, feel free to do a better job!
--
-- vim.cmd.colorscheme(colorschemeName)


require('onedark').setup {
}
require('onedark').load()


local ok, notify = pcall(require, "notify")
if ok then
  notify.setup({
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { focusable = false })
    end,
  })
  vim.notify = notify
  vim.keymap.set("n", "<Esc>", function()
    vim.cmd.nohlsearch()
    notify.dismiss({ silent = true, })
  end, { desc = "dismiss notify popup and clear hlsearch" })
end

-- NOTE: you can check if you included the category with the thing wherever you want.
if nixCats('general.extra') then
  -- I didnt want to bother with lazy loading this.
  -- I could put it in opt and put it in a spec anyway
  -- and then not set any handlers and it would load at startup,
  -- but why... I guess I could make it load
  -- after the other lze definitions in the next call using priority value?
  -- didnt seem necessary.
  vim.g.loaded_netrwPlugin = 1
  require("oil").setup({
    default_file_explorer = true,
    view_options = {
      show_hidden = true
    },
    columns = {
      "icon",
      "permissions",
      -- "size",
      -- "mtime",
    },
    skip_confirm_for_simple_edits = false,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  })
  vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, desc = 'Open Parent Directory' })
  vim.keymap.set("n", "<leader>-", "<cmd>Oil .<CR>", { noremap = true, desc = 'Open nvim root directory' })
end

require('lze').load {
  { import = "myLuaConf.plugins.telescope", },
  { import = "myLuaConf.plugins.treesitter", },
  { import = "myLuaConf.plugins.completion", },
  {
    "lazydev.nvim",
    for_cat = 'neonixdev',
    cmd = { "LazyDev" },
    ft = "lua",
    after = function(plugin)
      require('lazydev').setup({
        library = {
          { words = { "nixCats" }, path = (require('nixCats').nixCatsPath or "") .. '/lua' },
        },
      })
    end,
  },
  {
    "typst.vim",
    for_cat = 'general.markdown',
    ft = "typst",
    before = function(plugin)
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "typst-preview.nvim",
    for_cat = 'general.markdown',
    cmd = { "TypstPreview", "TypstPreviewStop", "TypstPreviewToggle", },
    ft = "typst",
    keys = {
      { "<leader>tp", "<cmd>TypstPreview <CR>",       mode = { "n" }, noremap = true, desc = "typst preview" },
      { "<leader>ts", "<cmd>TypstPreviewStop <CR>",   mode = { "n" }, noremap = true, desc = "typst preview stop" },
      { "<leader>tt", "<cmd>TypstPreviewToggle <CR>", mode = { "n" }, noremap = true, desc = "typst preview toggle" },
    },
    before = function(plugin)
      vim.g.mkdp_auto_close = 0
    end,
    after = function(plugin)
      require('typst-preview').setup({
        -- open_cmd = 'firefox %s -P typst-preview --class typst-preview'
        open_cmd = 'qutebrowser %s'
      })
    end,
  },
  {
    "markdown-preview.nvim",
    -- NOTE: for_cat is a custom handler that just sets enabled value for us,
    -- based on result of nixCats('cat.name') and allows us to set a different default if we wish
    -- it is defined in luaUtils template in lua/nixCatsUtils/lzUtils.lua
    -- you could replace this with enabled = nixCats('cat.name') == true
    -- if you didnt care to set a different default for when not using nix than the default you already set
    for_cat = 'general.markdown',
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle", },
    ft = "markdown",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview <CR>",       mode = { "n" }, noremap = true, desc = "markdown preview" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop <CR>",   mode = { "n" }, noremap = true, desc = "markdown preview stop" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle <CR>", mode = { "n" }, noremap = true, desc = "markdown preview toggle" },
    },
    before = function(plugin)
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "undotree",
    for_cat = 'general.extra',
    cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo", },
    keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" }, },
    before = function(_)
      vim.g.undotree_WindowLayout = 1
      vim.g.undotree_SplitWidth = 40
    end,
  },
  {
    "comment.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function(plugin)
      require('Comment').setup()
    end,
  },
  {
    "indent-blankline.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function(plugin)
      require("ibl").setup()
    end,
  },
  {
    "nvim-surround",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function(plugin)
      require('nvim-surround').setup({ keymaps = { visual = false }, })
    end,
  },
  -- {
  --   "vim-startuptime",
  --   for_cat = 'general.extra',
  --   cmd = { "StartupTime" },
  --   before = function(_)
  --     vim.g.startuptime_event_width = 0
  --     vim.g.startuptime_tries = 10
  --     vim.g.startuptime_exe_path = nixCats.packageBinPath
  --   end,
  -- },
  {
    "flash.nvim",
    for_cat = 'general.extra',
    after = function()
      require('flash').setup({
        modes = {
          treesitter_search = {
            remote_op = { restore = true, motion = true },
          },
        },
      })
      vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>lua require('flash').jump()<CR>", { noremap = true, desc = 'Flash' })
      vim.keymap.set({ "n", "x", "o" }, "S", "<cmd>lua require('flash').treesitter()<CR>",
        { noremap = true, desc = 'Flash Treesitter' })
      vim.keymap.set("o", "r", "<cmd>lua require('flash').remote()<CR>", { noremap = true, desc = 'Remote Flash' })
      vim.keymap.set({ "o", "x" }, "R", "<cmd>lua require('flash').treesitter_search()<CR>",
        { noremap = true, desc = 'Treesitter Search' })
      vim.keymap.set("c", "<c-s>", "<cmd>lua require('flash').toggle()<CR>",
        { noremap = true, desc = 'Toggle Flash Search' })
    end,
  },
  {
    "fidget.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function(plugin)
      require('fidget').setup({})
    end,
  },
  {
    "lualine.nvim",
    for_cat = 'general.always',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",


    after = function(plugin)
      require('lualine').setup {
        options = {
          -- icons_enabled = false,
          -- theme = colorschemeName,
          -- component_separators = '|',
          -- section_separators = '',
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1, status = true, } },
          lualine_x = { 'filetype' },
          -- lualine_y = { 'progress' },
          lualine_y = {
            {
              function()
                local cur = vim.fn.line('.')
                local total = vim.fn.line('$')
                local prog = ''
                if cur == 1 then
                  prog = 'Top'
                elseif cur == total then
                  prog = 'Bot'
                else
                  prog = string.format('%2d%%%%', math.floor(cur / total * 100))
                end
                if vim.v.hlsearch == 0 then
                  return prog
                end

                local local_ok, result = pcall(vim.fn.searchcount, { maxcount = 999999, timeout = 500 })
                if not local_ok or next(result) == nil then
                  return prog
                end

                local denominator = math.min(result.total, result.maxcount)
                return string.format('[%d/%d]', result.current, denominator)
              end
            }
          },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { { 'filename', path = 3, status = true } },
          lualine_c = {},
          lualine_x = { 'filetype' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = { 'buffers' },
          -- lualine_y = {{ 'searchcount', maxcount = 999999 }},
          lualine_y = {
          },
          lualine_z = { 'tabs' }
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },
  {
    "todo-comments.nvim",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    after = function(plugin)
      require('todo-comments').setup({
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info", alt = { "TODOO", "TODOOO" } },
        },
      })
    end,
  },
  { -- Git commands
    'vim-fugitive',
    for_cat = 'general.always',
    cmd = {
      'Git',
      'Gedit',
      'Gsplit',
      'Gdiffsplit',
      'Gvdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GRename',
      'GDelete',
      'GBrowse',
    },
  },
  {
    "gitsigns.nvim",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- cmd = { "" },
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      require('gitsigns').setup({
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to next hunk' })

          map({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to previous hunk' })

          -- Actions
          -- visual mode
          map('v', '<leader>hs', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'stage git hunk' })
          map('v', '<leader>hr', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'reset git hunk' })
          -- normal mode
          map('n', '<leader>gs', gs.stage_hunk, { desc = 'git stage hunk' })
          map('n', '<leader>gr', gs.reset_hunk, { desc = 'git reset hunk' })
          map('n', '<leader>gS', gs.stage_buffer, { desc = 'git Stage buffer' })
          map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
          map('n', '<leader>gR', gs.reset_buffer, { desc = 'git Reset buffer' })
          map('n', '<leader>gp', gs.preview_hunk, { desc = 'preview git hunk' })
          map('n', '<leader>gb', function()
            gs.blame_line { full = false }
          end, { desc = 'git blame line' })
          map('n', '<leader>gd', gs.diffthis, { desc = 'git diff against index' })
          map('n', '<leader>gD', function()
            gs.diffthis '~'
          end, { desc = 'git diff against last commit' })

          -- Toggles
          map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
          map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'toggle git show deleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end,
      })
      vim.cmd([[hi GitSignsAdd guifg=#04de21]])
      vim.cmd([[hi GitSignsChange guifg=#83fce6]])
      vim.cmd([[hi GitSignsDelete guifg=#fa2525]])
    end,
  },
  {
    "which-key.nvim",
    for_cat = 'general.extra',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      require('which-key').setup({
      })
      require('which-key').add {
        { "<leader><leader>",  group = "buffer commands" },
        { "<leader><leader>_", hidden = true },
        { "<leader>c",         group = "[c]ode" },
        { "<leader>c_",        hidden = true },
        { "<leader>d",         group = "[d]ocument" },
        { "<leader>d_",        hidden = true },
        { "<leader>g",         group = "[g]it" },
        { "<leader>g_",        hidden = true },
        { "<leader>m",         group = "[m]arkdown" },
        { "<leader>m_",        hidden = true },
        { "<leader>r",         group = "[r]ename" },
        { "<leader>r_",        hidden = true },
        { "<leader>s",         group = "[s]earch" },
        { "<leader>s_",        hidden = true },
        { "<leader>t",         group = "[t]oggles" },
        { "<leader>t_",        hidden = true },
        { "<leader>w",         group = "[w]orkspace" },
        { "<leader>w_",        hidden = true },
      }
    end,
  },
}
