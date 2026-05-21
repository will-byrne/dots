local secondaryWS = 3
if Hostname == "desktop" then
  secondaryWS = 2
end

hl.window_rule({
  enabled = false,
  match = {
    class = "^()$",
    title = "^()$",
  },
  no_blur = true,
})
hl.window_rule({
  enabled = true,
  match = {
    initial_class = "steam",
  },
  no_initial_focus = true,
  workspace = secondaryWS,
})
hl.window_rule({
  enabled = true,
  match = {
    initial_title = "Friends List"
  },
  float = true,
})
hl.window_rule({
  enabled = true,
  match = {
    class = "discord"
  },
  no_initial_focus = true,
  workspace = secondaryWS,
})
hl.window_rule({
  enabled = true,
  match = {
    class = "signal"
  },
  no_initial_focus = true,
  workspace = secondaryWS,
})
