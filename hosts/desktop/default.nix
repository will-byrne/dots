{ hostname, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../optional/amd.nix
  ];
  
  networking.hostName = hostname;
}
