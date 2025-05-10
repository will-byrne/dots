{ pkgs, ... }:
{
  home.packages = with pkgs; [
    beyond-all-reason
    #brogue does not work on wayland
    cataclysm-dda
    endless-sky
    hedgewars
    luanti-client
    mindustry-wayland
    openttd
    osu-lazer-bin
    shattered-pixel-dungeon
    warzone2100
    zeroad-unwrapped
  ];
}
