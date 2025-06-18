{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gargoyle
    beyond-all-reason
    #brogue does not work on wayland
    cataclysm-dda
    endless-sky
    flare
    hedgewars
    luanti-client
    mindustry-wayland
    openttd
    osu-lazer-bin
    shattered-pixel-dungeon
    warzone2100
    xivlauncher
    zeroad-unwrapped
  ];
}
