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
    kdePackages.kdenlive
    audacity
    #lmms #uninstalled because of https://github.com/NixOS/nixpkgs/issues/389149
    bitwig-studio
    musescore
    reaper
    gimp
    qbittorrent
    vlc
    libreoffice
  ];
}
