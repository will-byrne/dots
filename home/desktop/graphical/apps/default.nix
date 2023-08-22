{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [ 
    slack
    musescore
    zoom
    cider
    imv
    osu-lazer-bin
    krita
    yacreader
  ];
}
