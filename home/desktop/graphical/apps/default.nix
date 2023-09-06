{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [ 
    slack
    musescore
    zoom-us
    cider
    imv
    osu-lazer-bin
    krita
    yacreader
  ];
}
