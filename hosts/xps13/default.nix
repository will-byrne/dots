{ hostname, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../optional/laptop.nix
  ];
  
  networking.hostName = hostname;
}
