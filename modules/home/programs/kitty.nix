{pkgs, lib, ...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_familly = "IosevkaTerm Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
      font_size = "11.0";
      window_padding_width = 25;
      cursor_trail = 1;
    };
    extraConfig = ''
      include themes/noctalia.conf
    '';
  };
}
