{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gargoyle
    beyond-all-reason
    cataclysm-dda
    endless-sky
    flare
    hedgewars
    lincity-ng
    luanti-client
    mindustry-wayland
    openttd
    osu-lazer-bin
    shattered-pixel-dungeon
    veloren
    vvvvvv
    xivlauncher
    #warzone2100
    zeroad-unwrapped
  ];
}
