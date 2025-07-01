{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "250";
        height = "(75,150)";
        origin = "top-right";
        offset = "(30, 30)";
        alignment = "center";
        notification_limit = 20;
        progress_bar_height = 10;
        progress_bar_min_width = 150;
        progress_bar_max_width = 250;
        progress_bar_corner_radius = 5;
        icon_corner_radius = 5;
        corner_radius = 5;
        frame_width = 2;
        gap_size = 1;
        font = "Iosevka Nerd Font 9";
        format = "<b>%s</b>\n%b";
        enable_recursive_icon_lookup = true;
        min_icon_size = 32;
        max_icon_size = 64;
        frame_color = "#8aadf4";
        separator_color= "frame";
        highlight = "#8aadf4";
        transparency = 5;
      };

      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
      };

      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#f5a97f";
      };
    };
  };
}
