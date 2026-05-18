local f = io.open("/etc/hostname", "r")
if not f then return nil end
local h = f:read("*l")

if h == "desktop" then
  hl.monitor({
    output = "DP-1",
    position = "0x0",
    scale = "1",
    vrr = 2,
    bitdepth = 10,
    mode = "3840x1600@120"
  })
  hl.monitor({
    output = "DP-2",
    position = "3840x0",
    scale = 1.67, -- alter this possible for btop
    transform = 3,
    mode = "3840x1100"
  })
  hl.workspace_rule({ workspace = "1", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "2", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "3", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "4", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "5", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "6", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "7", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "8", persistent = false, monitor = "DP-1" })
  hl.workspace_rule({ workspace = "9", persistent = false, monitor = "DP-2" })
else
  hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
  })
end
