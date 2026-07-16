{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    cursorTheme = {
      name = "Catppuccin Cursors";
      package = pkgs.catppuccin-cursors.macchiatoPink;
      size = 24;
    };
    gtk4.enable= false;
  };

  home.packages = with pkgs; [
    nwg-look
    gtk-engine-murrine
  ];
}
