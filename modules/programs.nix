{ pkgs, ... }:
{
  programs = {
    uwsm = {
      enable = true;
    };
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    zsh.enable = true;
  };
}
