{ pkgs, ... }: let
  theme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/btop/refs/heads/main/themes/catppuccin_macchiato.theme";
    hash = "sha256-+LGMyyF71OvBhIBqkdSaEssxK5zzfYuiMyJlOnisiFA=";
  };
in {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_macchiato";
    };
  };
  xdg.configFile = {
    "btop/themes/catppuccin_macchiato.theme".source = theme;
  };
}
