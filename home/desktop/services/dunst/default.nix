{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    dunst
  ];

  services.dunst = {
    enable = true;
    configFile = ''
      [global]
      frame_color = "#8AADF4"
      separator_color= frame

      [urgency_low]
      background = "#24273A"
      foreground = "#CAD3F5"

      [urgency_normal]
      background = "#24273A"
      foreground = "#CAD3F5"

      [urgency_critical]
      background = "#24273A"
      foreground = "#CAD3F5"
      frame_color = "#F5A97F"
    '';
  };
}
