{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    #./eww
  ];
  home.packages = with pkgs; [ 
    slack
    musescore
    zoom
    cider
    imv
    osu-lazer-bin
    krita
  ];
}
