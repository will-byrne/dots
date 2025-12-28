{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./foot.nix
    ./fuzzel.nix
    ./gtk.nix
    ./hyprland
    ./kitty.nix
    ./waybar
  ];

  services = {
    network-manager-applet.enable = true;
  };

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
