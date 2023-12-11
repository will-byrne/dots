{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ 
    slack
    musescore
    cider
    imv
    osu-lazer-bin
    krita
    yacreader
  ];
}
