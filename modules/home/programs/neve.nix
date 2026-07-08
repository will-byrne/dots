{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.neve.packages.${pkgs.system}.default
  ];
}
