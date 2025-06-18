{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "pink";
      };
    };
    cursorTheme = {
      name = "Catppuccin Cursors";
      package = pkgs.catppuccin-cursors.macchiatoPink;
      size = 24;
    };
    # gtk3.extraConfig = {
    #   gtk-application-prefer-dark-theme = 1;
    # };
    # gtk4.extraConfig = {
    #   Settings = ''
    #     gtk-application-prefer-dark-theme=1
    #   '';
    # };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.packages = with pkgs; [
    gtk-engine-murrine
  ];
}
