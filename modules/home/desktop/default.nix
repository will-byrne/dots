{ pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./hyprland
  ];

  home.packages = with pkgs; [
    libnotify
    grim
    slurp
    wl-clipboard
    cliphist
    pavucontrol
    pamixer
    playerctl
    brightnessctl
  ];
}
