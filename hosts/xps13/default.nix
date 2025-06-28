{ hostname, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../optional/fingerprint.nix
    ../optional/laptop.nix
  ];
  
  networking.hostName = hostname;
}
