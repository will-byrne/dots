{ config, pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
    ];
  };

  home.packages = with pkgs; [
    obsidian
    calibre
    koreader
    audacity
    lmms
    musescore
    ardour
    gimp
    vlc
    oneko #move
  ];

  home.file."${config.xdg.dataHome}/applications/krita-appimage.desktop".text = ''
[Desktop Entry]
Name=Krita (AppImage)
Comment=Launch Krita from the local AppImage bundle
Exec=appimage-run /home/luna/appimages/krita.AppImage %U
Icon=krita
Terminal=false
Type=Application
Categories=Graphics;2DGraphics;RasterGraphics;
StartupWMClass=krita
'';
}
