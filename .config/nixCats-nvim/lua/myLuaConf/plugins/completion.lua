---packadd + after/plugin
---@type fun(names: string[]|string)
local load_w_after_plugin = require('nixCatsUtils.lzUtils').make_load_with_after({ "plugin" })

-- NOTE: packadd doesnt load after directories.
-- hence, the above function that you can get from luaUtils that exists to make that easy.

return {
  {
    "cmp-buffer",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-cmdline",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-cmdline-history",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-nvim-lsp",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    dep_of = { "nvim-lspconfig" },
    load = load_w_after_plugin,
  },
  {
    "cmp-nvim-lsp-signature-help",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-nvim-lua",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-path",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp_luasnip",
    for_cat = 'general.cmp',
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "friendly-snippets",
    for_cat = 'general.cmp',
    dep_of = { "nvim-cmp" },
  },
  {
    "lspkind.nvim",
    for_cat = 'general.cmp',
    dep_of = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "luasnip",
    for_cat = 'general.cmp',
    dep_of = { "nvim-cmp" },
    after = function (plugin)
    require("myLuaConf.plugins.luasnip")
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {
        enable_autosnippets = true,
      }

      local ls = require('luasnip')

      vim.keymap.set({ "i", "s" }, "<M-n>", function()
          if ls.choice_active() then
              ls.change_choice(1)
          end
      end)

    end,
  },
  {
    "nvim-cmp",
    for_cat = 'general.cmp',
    -- cmd = { "" },
    event = { "DeferredUIEnter" },
    on_require = { "cmp" },
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function (plugin)
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      cmp.setup {
        formatting = {
          format = lspkind.cmp_format {
            mode = 'text',
            with_text = true,
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            menu = {
              buffer = '[BUF]',
              nvim_lsp = '[LSP]',
              nvim_lsp_signature_help = '[LSP]',
              nvim_lsp_document_symbol = '[LSP]',
              nvim_lua = '[API]',
              path = '[PATH]',
              luasnip = '[SNIP]',
            },
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward (hah)
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['jk'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },

        sources = cmp.config.sources {
          -- The insertion order influences the priority of the sources
          { name = 'nvim_lsp'--[[ , keyword_length = 3 ]] },
          { name = 'nvim_lsp_signature_help'--[[ , keyword_length = 3  ]]},
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
        enabled = function()
          return vim.bo[0].buftype ~= 'prompt'
        end,
        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      }

      cmp.setup.filetype('lua', {
        sources = cmp.config.sources {
          { name = 'nvim_lua' },
          { name = 'nvim_lsp'--[[ , keyword_length = 3  ]]},
          { name = 'nvim_lsp_signature_help'--[[ , keyword_length = 3  ]]},
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },{
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'nvim_lsp_document_symbol'--[[ , keyword_length = 3  ]]},
          { name = 'buffer' },
          { name = 'cmdline_history' },
        },
        view = {
          entries = { name = 'wildmenu', separator = '|' },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'cmdline' },
          -- { name = 'cmdline_history' },
          { name = 'path' },
        },
      })
    end,
  },
}
