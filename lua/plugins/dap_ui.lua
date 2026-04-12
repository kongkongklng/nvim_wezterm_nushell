return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },

  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      mode = { "n", "x" },
      desc = "Eval",
    },
  },

  opts = {
    -- 你可以保持默认
  },

  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup(opts)

    --------------------------------------------------------------------
    -- 方案 B：记录 & 恢复窗口布局（确保 Neo-tree 不会变化）
    --------------------------------------------------------------------
    local saved_layout = nil

    -- 调试开始前保存布局
    dap.listeners.before.event_initialized["save_layout"] = function()
      saved_layout = vim.fn.winrestcmd() -- 保存整个窗口布局状态
      dapui.open({})
    end

    -- 调试结束恢复布局
    local function restore_layout()
      dapui.close({})
      if saved_layout then
        vim.cmd(saved_layout) -- 恢复窗口布局
      end
    end

    dap.listeners.before.event_terminated["restore_layout"] = restore_layout
    dap.listeners.before.event_exited["restore_layout"] = restore_layout
  end,
}
