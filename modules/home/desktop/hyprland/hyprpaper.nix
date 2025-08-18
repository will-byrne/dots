{
  inputs,
  pkgs,
  config,
  hostname,
  ...
}: let
  wallpaperCat = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/refs/heads/main/misc/rainbow-cat.png";
    hash = "sha256-WP+kQ7mgjpeekatDEPSP/XeDc5ZihCm+BxgqgwYDIEU=";
  };
  
  wallpaperSwitch = pkgs.fetchurl {
    url = "https://www.alexotos.com/wp-content/uploads/2020/03/4k-wallpaper.jpg";
    hash = "sha256-3KV5+Ig1e7TfdJxUYWvltczRgN8O7bpOFGKbx7SKbqI=";
  };
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        (builtins.toString wallpaperCat)
        (builtins.toString wallpaperSwitch)
      ];

      wallpaper = [
        ",${builtins.toString wallpaperSwitch}"
      ];
    };
  };
}
