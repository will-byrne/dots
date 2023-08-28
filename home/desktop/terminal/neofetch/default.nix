{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.neofetch];
  # home.file.".config/neofetch/config.conf".text = import ./config.nix;
  # home.file.".config/neofetch/config.conf".text = import ./minimal.nix;
  home.file.".config/neofetch/config.conf".text = import ./pride.nix;
  home.file.".config/neofetch/pride.png" = {
    source = ./images/pride.png;
  };
  # home.file.".config/neofetch/config.conf".text = import ./geometrical.nix;
}
