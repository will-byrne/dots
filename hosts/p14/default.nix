{
  imports = [
    ./hardware-configuration.nix
    ../optional/amd.nix
    ../optional/fingerprint.nix
    ../optional/laptop.nix
  ];
  
  networking.hostName = "p14nixos";
}
