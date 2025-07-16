vim.diagnostic.config({
  -- virtual_text = { severity = { max = vim.diagnostic.severity.WARN } },
  -- virtual_lines = { severity = { min = vim.diagnostic.severity.ERROR } },
  virtual_text = true,
  virtual_lines = false,
  underline = true,
  update_in_insert = false,
})
