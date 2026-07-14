hl.device({
  name = "cx-2.4g-wireless-receiver",
  kb_layout = "us",
})
hl.device({
  name = "by-tech-gaming-keyboard",
  kb_layout = "us",
})
hl.device({
  name = "ilitek-------ilitek-touch",
  enabled = false,
})
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
hl.config({
  input = {
    kb_layout    = "gb,gb",
    kb_variant   = ",dvorak",
    kb_options   = "caps:escape",
    follow_mouse = 1,
    sensitivity  = 0.0,

    touchpad     = {
      natural_scroll = true,
    },
    tablet       = {
      output = "DP-1",
    }
  }
})
