vim.g.mapleader = " "

local map = vim.keymap.set
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<A-k>", "V:m '<-2<cr>gv=gv<esc>", { desc = "Move line up" })
map({ "n", "i", "v" }, "<A-j>", "V:m '>+1<cr>gv=gv<esc>", { desc = "Move line down" })
map({ "n", "v" }, "<S-h>", "^", { desc = "Move to front of line" })
map({ "n", "v" }, "<S-l>", "$", { desc = "Move to end of line" })
map({ "n", "v" }, "<", "<gv", { desc = "Move indent left once" })
map({ "n", "v" }, ">", ">gv", { desc = "Move indent left once" })
map({ "n", "v", "t", "x" }, "<A-,>", "<C-w><", { desc = "Move indent left once" })
map({ "n", "v", "t", "x" }, "<A-.>", "<C-w>>", { desc = "Move indent left once" })
--map({ "n", "v" }, "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR> ", { desc = "Move to left pane" })
--map({ "n", "v" }, "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR> ", { desc = "Move to down pane" })
--map({ "n", "v" }, "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>   ", { desc = "Move to up pane" })
--map({ "n", "v" }, "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Move to right pane" })

map({"n"}, "<leader>+", "<C-a>", {desc = "Increment number by one"})
map({"n"}, "<leader>-", "<C-x>", {desc = "Decrement number by one"})

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
--map({ "n", "v", "i", "t" }, "<C-b>", function()
--  require("nvchad.term").runner {
--    id = "RunAndBuildTerminal",
--    pos = "float",
--    cmd = function()
--      local file = vim.fn.expand "%"
--      local sfile = vim.fn.expand "%:r"
--      local ft_cmds = {
--        sh = "bash " .. file,
--        rust = "cargo " .. file,
--        python = "python3 " .. file,
--        javascript = "node " .. file,
--        java = "javac " .. file .. " && java " .. sfile,
--        go = "go build && go run " .. file,
--        c = "g++ " .. file .. " -o " .. sfile .. " && ./" .. sfile,
--        cpp = "g++ " .. file .. " -o " .. sfile .. " && ./" .. sfile,
--        typescript = "deno compile " .. file .. " && deno run " .. file,
--      }
--      return ft_cmds[vim.bo.ft]
--    end,
--  }
--end, { desc = "Build and Run file" })

-- map({ "n", "v", "i" }, "<C-b>", function()
--   RunCode()
-- end, { desc = "Build and Run file" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
