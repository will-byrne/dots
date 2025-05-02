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
    pokemon-colorscripts-mac
  ];
  home.file.".config/fortunes" = {
    source = ./fortunes;
    recursive = true;
  };
}
