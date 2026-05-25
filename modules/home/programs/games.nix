{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gargoyle
    mindustry-wayland
    openttd
    osu-lazer-bin
    # veloren
    # vvvvvv
    xivlauncher
    protonplus
    faugus-launcher
  ];
}
