{ pkgs, ... }:
{
  home.packages = with pkgs; [
    siril
    kstars
    gnuastro
  ];
}
