local plugins = {
  {
    "wuelnerdotexe/vim-astro",
    ft = {
      "astro"
    }
  },
  {
    "mbbill/undotree",
    config = function (_, _)
      require("core.utils").load_mappings("undotree")
    end,
    event = "VeryLazy",
  },
  {
    "jiriks74/presence.nvim",
    event = "UIEnter",
    config = function ()
      require("presence").setup({
        neovim_image_text = "hello",
      })
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "cmake-language-server",
        "clang-format",
        "codelldb",
        "typescript-language-server",
        "tailwindcss-language-server",
        "astro-language-server",
        "vue-language-server",
        "rust-analyzer",
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "astro",
      "vue",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      "lua",
      "javascript",
      "typescript",
      "tsx",
    }
  },
}
return plugins
