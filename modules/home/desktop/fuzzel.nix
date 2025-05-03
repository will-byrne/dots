{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Iosevka Nerd Font:size=12";
        icon-theme = "Papirus";
        width = 60;
        lines = 8;
        line-height = 30;
        horizontal-pad = 20;
        terminal = "kitty -e";
        dpi-aware = "no";
      };
      border = {
        width = 2;
      };
    };
  };
}
