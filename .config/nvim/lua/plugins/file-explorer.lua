return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        -- Disable netrw at the very start of your init.lua
        disable_netrw = true,
        hijack_netrw = true,
        -- Open the tree when running this setup function
        open_on_setup = false,
        -- Will not open on setup if the filetype is in this list
        ignore_ft_on_setup = {},
        -- Opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = false,
        -- Hijacks new directory buffers when they are opened
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        -- Hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = false,
        -- Updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = false,
        -- Show lsp diagnostics in the signcolumn
        diagnostics = {
          enable = false,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        -- Update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {},
        },
        -- Configuration options for the system open command (`s` in the tree by default)
        system_open = {
          cmd = nil,
          args = {},
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 400,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
        },
      })

      -- Key mappings for nvim-tree
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, silent = true, noremap = true }
      end

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts("Toggle file explorer"))
      vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", opts("Focus file explorer"))
      vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", opts("Find current file in explorer"))
      vim.keymap.set("n", "<leader>c", ":NvimTreeCollapse<CR>", opts("Collapse file explorer"))
    end,
  },
}
