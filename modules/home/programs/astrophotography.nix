{ pkgs, ... }:
{
  home.packages = with pkgs; [
    siril
    kstars
    gnuastro
    #pixinsight // waiting merge of https://github.com/NixOS/nixpkgs/pull/480103
  ];
}
