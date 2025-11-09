return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    start_in_insert = true,
    open_mapping = [[<A-p>]],
    shell = '"C:\\Program Files\\nu\\bin\\nu.exe"', -- 注意双引号
    direction = "float",
    hide_numbers = true,
    shading_factor = 2,
    persist_size = true,
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = true,
    winbar = "Terminal",
  },
}
