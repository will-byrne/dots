{ pkgs, ...}: {
  programs.waybar = {
    enable = true;
  };
  home.packages = with pkgs; [
    wttrbar
  ];

  xdg.configFile = {
    "waybar/config".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
