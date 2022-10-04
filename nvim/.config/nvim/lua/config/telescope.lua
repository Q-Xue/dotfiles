local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<C-w>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
	  fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case"
	  }
  },
}

telescope.load_extension('fzf')


-- --------------- keybindings ---------------
local opts = { silent = true,}
-- vim.keymap.set("n", "tff", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "tff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.keymap.set("n", "tlg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

-- live grep in specific dir
_G.telescope_live_grep_in_path = function(path)
    local _path = path or vim.fn.input("Dir: ", "", "dir")
    require("telescope.builtin").live_grep({search_dirs = {_path}})
end

-- find files in specific path
_G.telescope_find_files_in_path = function(path)
    local _path = path or vim.fn.input("Dir: ", "", "dir")
    require("telescope.builtin").find_files({search_dirs = {_path}})
end


vim.keymap.set("n", "tgd", "<cmd>lua telescope_live_grep_in_path()<cr>", opts)
vim.keymap.set("n", "tfd", "<cmd>lua telescope_find_files_in_path()<cr>", opts)









