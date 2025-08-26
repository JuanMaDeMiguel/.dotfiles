-- Establece la tecla <leader> como espacio
vim.g.mapleader = " "

-- Abre el explorador de archivos nativo de Neovim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Mover línea(s) seleccionada(s) hacia abajo en modo visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Mover línea(s) seleccionada(s) hacia arriba en modo visual
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Une la línea siguiente a la actual sin mover el cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Avanza media página centrando la vista
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Retrocede media página centrando la vista
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Busca siguiente coincidencia y centra
vim.keymap.set("n", "n", "nzzzv")
-- Busca coincidencia anterior y centra
vim.keymap.set("n", "N", "Nzzzv")

-- Reindenta un párrafo y vuelve al punto original
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Reinicia el LSP
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Pegar sobre selección sin perder el contenido del portapapeles
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copiar al portapapeles del sistema
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Eliminar sin afectar el portapapeles
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Desactiva la tecla Q (evita entrar en modo Ex por error)
vim.keymap.set("n", "Q", "<nop>")

-- Abre el tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-t>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-n>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-s>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

-- Formatea el buffer actual con Conform
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ bufnr = 0 })
end)

-- Navegar entre errores del quickfix
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Navegar entre errores de la lista local
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Buscar y reemplazar la palabra bajo el cursor en todo el archivo
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Hacer ejecutable el archivo actual
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Inserta bloque if err != nil y return err (Go)
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Inserta assert.NoError(err, "") (Go)
vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a')

-- Inserta bloque if err != nil con log.Fatalf (Go)
vim.keymap.set("n", "<leader>ef", 'oif err != nil {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj')

-- Inserta bloque if err != nil con logger.Error (Go)
vim.keymap.set("n", "<leader>el", 'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i')

-- Inicia animación "make it rain" del plugin Cellular Automaton
vim.keymap.set("n", "<leader>ca", function()
	require("cellular-automaton").start_animation("make_it_rain")
end)

-- Inicia animación "Game of Life" del plugin Cellular Automaton
vim.keymap.set("n", "<leader>cq", function()
	require("cellular-automaton").start_animation("game_of_life")
end)

-- Recarga el archivo de configuración actual
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
