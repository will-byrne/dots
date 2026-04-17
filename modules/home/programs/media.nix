{ pkgs, ... }:
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
    gimp
    vlc
    krita
    oneko #move
  ];
}
