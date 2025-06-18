{ pkgs, ... }:
{
  home.packages = with pkgs; [
    koboldcpp
  ];
}
