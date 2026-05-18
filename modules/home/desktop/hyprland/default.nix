{ pkgs, hostname, lib, ... }: {
  
  imports = [
    # ./hyprpaper.nix
    # ./hyprlock.nix
    ./hypridle.nix
    # ./hyprsunset.nix
    ./hyprpolkit.nix
  ];

  home.file.".config/hypr" = {
    source = ./lua;
    recursive = true;
  };

  home.packages = with pkgs; [ hyprpicker ];
}
