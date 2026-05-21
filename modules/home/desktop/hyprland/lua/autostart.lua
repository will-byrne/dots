hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia-shell")
  if Hostname == "desktop" then
    hl.exec_cmd("kitty --class btop btop", { workspace = "9", fullscreen = true })
    hl.exec_cmd("kitty --class dots --directory ~/dots nvim", { workspace = "1" })
    hl.exec_cmd("firefox", { workspace = "1" })
    hl.exec_cmd("steam", { workspace = "2" })
    hl.exec_cmd("discord", { workspace = "2" })
    hl.exec_cmd("signal-desktop", { workspace = "2" })
  else
    hl.exec_cmd("kitty --class dots --directory ~/dots nvim", { workspace = "1" })
    hl.exec_cmd("firefox", { workspace = "2" })
    hl.exec_cmd("discord", { workspace = "3" })
    hl.exec_cmd("signal-desktop", { workspace = "3" })
  end
end)
