{
  inputs,
  pkgs,
  config,
  ...
}: let
  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/refs/heads/main/misc/rainbow-cat.png";
    hash = "sha256-WP+kQ7mgjpeekatDEPSP/XeDc5ZihCm+BxgqgwYDIEU=";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };
}