local status_ok, codeium = pcall(require, "neocodeium")
if not status_ok then
  return
end

-- Setup
codeium.setup()
