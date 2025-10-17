return {
  "preservim/vim-markdown",
  branch = "master", -- importante: seguir master
  ft = { "markdown" }, -- opcional, para que solo se cargue con archivos .md
  dependencies = {
    "godlygeek/tabular", -- requerido por vim-markdown
  },
  config = function ()
    vim.g.vim_markdown_folding_disabled = 1
  end
}

