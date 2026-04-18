{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonplus
    faugus-launcher
    wowup-cf
  ];
}
