return {
  {
    "xero/miasma.nvim",
    branch = "dev", -- ② 指定使用 dev 分支，而不是默认的 main 分支
    dependencies = { -- ③ 这个主题依赖的库（必须一起安装）
      "rktjmp/lush.nvim", -- lush.nvim 用来构建/生成主题色方案
      "rktjmp/shipwright.nvim", -- shipwright.nvim 用来构建/导出主题文件
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "miasma",
    },
  },
}
