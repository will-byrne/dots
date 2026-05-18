hl.config({
  -- animation = {
  --   enabled = true,
  -- },

  decoration = {
    rounding = 20,
    rounding_power = 2,
    blur = {
      enabled = true,
      special = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
      new_optimizations = true,
      ignore_opacity = true,
      xray = true,
    },
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },

  dwindle = {
    preserve_split = true,
  },

  general = {
    gaps_in = 5,
    gaps_out = 10,

    border_size = 2,

    col = {
      active_border = { colors = { "rgba(ca9ee6ff)", "rgba(f2d5cfff)" }, angle = 45 },
      inactive_border = { colors = { "rgba(b4b3fecc)", "rgba(6c7086cc)" }, angle = 45 },
    },

    layout = "dwindle",

    resize_on_border = true,
    allow_tearing = true,
  },

  group = {
    col = {
      border_active = { colors = { "rgba(F8032Aff)", "rgba(52292Fff)" }, angle = 45 },
      border_inactive = { colors = { "rgba(b4befecc)", "rgba(6c7086cc)" }, angle = 45 },
      border_locked_active = { colors = { "rgba(ca9ee6ff)", "rgba(f2d5cfff)" }, angle = 45 },
      border_locked_inactive = { colors = { "rgba(b4befecc)", "rgba(6c7086cc)" }, angle = 45 },
    },
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    vrr = 2,
  },

  -- XWayland = {
  --   enabled = true,
  --   force_zero_scaling = true,
  -- },
})
