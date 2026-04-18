{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonplus
    faugus-launcher
  ];
}
