{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.rust-rover
    neovide
    bun
    nodejs_23
  ];
}
