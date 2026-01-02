return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    -- Compiler settings for XeLaTeX or LuaLaTeX
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-xelatex", -- Use XeLaTeX
        -- '-lualatex',  -- Uncomment for LuaLaTeX instead
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- Explicitly set the engine
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-xelatex",
    }

    -- PDF Viewer settings
    vim.g.vimtex_view_method = "zathura"

    -- Turn off concealing
    vim.g.vimtex_syntax_conceal_disable = 1
  end,
}
