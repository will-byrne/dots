{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common/amd.nix
    ../common/laptop.nix
    ../common
  ];
  
  networking.hostName = "p14nixos";
}
