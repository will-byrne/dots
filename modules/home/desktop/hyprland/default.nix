{ pkgs, hostname, lib, ... }: {
  
  imports = [
    ./hypridle.nix
    ./hyprpolkit.nix
  ];

  home.file.".config/hypr" = {
    source = ./lua;
    recursive = true;
  };

  home.packages = with pkgs; [ hyprpicker ];
}
