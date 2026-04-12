return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    "mfussenegger/nvim-dap-python",
    config = function()
      -- 自动取当前项目 venv
      local cwd = vim.fn.getcwd()
      local python = cwd .. "/.venv/Scripts/python.exe"

      -- 配置 dap-python
      require("dap-python").setup(python)

      -- 覆盖 adapter，使其不弹黑窗口
      local dap = require("dap")
      dap.adapters.python = {
        type = "executable",
        command = python,
        args = { "-m", "debugpy.adapter" },
        options = {
          windows_hide = true, -- ★ 关键：隐藏终端窗口
          detached = false,
        },
      }
    end,
  },
}
