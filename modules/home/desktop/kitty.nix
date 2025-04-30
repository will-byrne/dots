{pkgs, lib, ...}: {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_familly = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
      font_size = "9.0";
      window_padding_width = 25;
    };
    #themeFile = "Catppuccin-Macchiato";
  };
}