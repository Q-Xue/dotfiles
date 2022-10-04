-- -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
-- vim.g.nvim_tree_git_hl = 1

-- -- 0 by default, will enable folder and file icon highlight for opened files/directories.
-- vim.g.nvim_tree_highlight_opened_files = 1

-- -- This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_root_folder_modifier = ':~'

-- -- 0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_add_trailing = 1

-- -- 0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_group_empty = 1

-- -- one space by default, used for rendering the space between the icon and the filename.
-- -- Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_icon_padding = ' '

-- -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
-- vim.g.nvim_tree_symlink_arrow = ' >> '

-- -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
-- vim.g.nvim_tree_respect_buf_cwd = 1

-- -- 0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
-- vim.g.nvim_tree_create_in_closed_folder = 1

-- -- List of filenames that gets highlighted with NvimTreeSpecialFile
-- vim.g.nvim_tree_special_files = { Makefile= 1, MAKEFILE= 1 }

-- -- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- -- 1 by default, notice that if 'files' is 1, it will only display
-- -- if nvim-web-devicons is installed and on your runtimepath.
-- -- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- -- but this will not work when you set renderer.indent_markers.enable (because of UI conflict)
-- vim.g.nvim_tree_show_icons = {
--      git = 0,
--      folders = 1,
--      files = 1,
--      folder_arrows = 0,
--      }



-- -- following options are the default
-- -- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = "",
--     staged = "S",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "U",
--     ignored = "◌",
--   },
--   folder = {
--     default = "",
--     open = "",
--     empty = "",
--     empty_open = "",
--     symlink = "",
--   },
-- }



local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- -------------------- map example --------------------
-- -- It adds motions like 25j and 30k to the jump list, so you can cycle
-- -- through them with control-o and control-i.
-- -- source: https://www.vi-improved.org/vim-tips/
-- map("n", "j", [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], { expr = true })
-- map("n", "k", [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], { expr = true })
-- -- <Tab> to navigate the completion menu
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- map("i", "<s-cr>", "<c-o>o")         -- adds new line below (insert)
-- map("i", "<c-cr>", "<c-o>O")         -- adds new line above (insert)



-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>






local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- ------------------ callback is deprecated ---------------------
-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--   return
-- end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = true,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  respect_buf_cwd = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        -- { key = "h", cb = tree_cb "close_node" },
        -- { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "MAKEFILE", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
}

-- auto_close option is replaced by this autocmd
vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

