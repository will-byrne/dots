hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia-shell")
  hl.exec_cmd("kitty --class btop btop", { workspace = "9", fullscreen = true })
end)
