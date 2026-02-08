{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    fortune
    ponysay
    pokemonsay
    cowsay
    pokemon-colorscripts
  ];
  home.file.".config/fortunes" = {
    source = ./fortunes;
    recursive = true;
  };
}
