vim.g.mapleader = " "

local keymap = vim.keymap

--> fast way to escape insert mode
keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
keymap.set('n', 'S', ':%s/', {noremap = true})

--> write and quit files
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<C-x>", ":q<CR>", { desc = "Quit file" })
keymap.set("n", "<C-e>", ":Explore<CR>", { desc = "Open netrw" })

--> no hl search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

--> window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<CR>", { desc = "Toggle transparent background"})
keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat"})

keymap.set("n", "<S-Right>", "<cmd>vertical resize +5<CR>", { desc = "Increase vertical size" })
keymap.set("n", "<S-Left>", "<cmd>vertical resize -5<CR>", { desc = "Decrease vertical size" })
keymap.set("n", "<S-Up>", "<cmd>resize +5<CR>", { desc = "Increase horizontal size" })
keymap.set("n", "<S-Down>", "<cmd>resize -5<CR>", { desc = "Decrease horizontal size" })

keymap.set("n", "<Left>", "<cmd>set nonu nornu<CR>", { desc = "Turn off line numbers" })
keymap.set("n", "<Right>", "<cmd>set nu rnu<CR>", { desc = "Turn on line numbers" })

