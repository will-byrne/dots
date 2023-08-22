{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    dunst
  ];

  home.file.".config/dunst/icons" = {
    source = ./icons;
    recursive = true;
  };
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "none";
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 20;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 125;
        progress_bar_max_width = 250;
        progress_bar_corner_radius = 4;
        icon_corner_radius = 5;
        indicate_hidden = "yes";
        transparency = 10;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 10;
        frame_width = 3;
        frame_color = "#8AADF4";
        gap_size = 5;
        separator_color = "frame";
        sort = "yes";
        font = "mononoki Nerd Font 12";
        line_height = 3;
        markup = "full";
        format = ''󰟪 %a\n<b>󰋑 %s</b>\n%b'';
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#24273A";
        foreground = "#CAD3F5";
        icon = "~/.config/dunst/icons/low.svg";
        timeout = 10;
      };
      urgency_normal = {
        background = "#24273A";
        foreground = "#CAD3F5";
        icon = "~/.config/dunst/icons/pokeball.svg";
        timeout = 10;
      };
      urgency_critical = {
        background = "#24273A";
        foreground = "#CAD3F5";
        frame_color = "#F5A97F";
        icon = "~/.config/dunst/icons/critical.svg";
        timeout = 0;
      };
      volume-control = {
        summary = "volctl";
        format = ''<span size="250%">%a</span>\n%b'';
      };
    };
  };
}
