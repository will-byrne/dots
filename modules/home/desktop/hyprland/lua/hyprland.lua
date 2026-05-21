local f = io.open("/etc/hostname", "r")
if f then
  Hostname = f:read("*l")
  f:close()
else
  Hostname = nil
end

require("animations")
require("autostart")
require("env")
require("input")
require("keybinds")
require("layerrule")
require("monitors")
require("settings")
require("windowrule")
