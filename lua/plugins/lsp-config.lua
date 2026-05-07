return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls", "glsl_analyzer", "ruff", "pyrefly"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- lua_ls
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable({"lua_ls"})
      -- java  
      --
      vim.lsp.config("jdtls", {
        capabilities = capabilities,
      })
      vim.lsp.enable({"jdtls"})

      vim.lsp.config("pyrefly", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = "off",
                pytestParameters = true,
              },
            },
          },
        },
      })
      vim.lsp.enable({"pyrefly"})
      
      vim.lsp.config("ruff", {
        capabilities = capabilities,
      })
      vim.lsp.enable({"ruff"})
      
      --clangd 
      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })
       
      vim.lsp.enable({"clangd"})

      vim.lsp.config("glsl_analyzer", {
        capabilities = capabilities,
      })

      vim.lsp.enable({"glsl_analyzer"})

      vim.lsp.inlay_hint.enable(true)
      -- keybinds
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {})
      vim.diagnostic.config({ virtual_text = false, virtual_text= { current_line = true }, })

		end,
	},
}
