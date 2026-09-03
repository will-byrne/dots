{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gargoyle
    openttd
    osu-lazer-bin
  ];
}
