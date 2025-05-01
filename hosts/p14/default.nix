{
  imports = [
    ./catppuccin.nix
    ./hardware-configuration.nix
    ./users.nix
  ];

  networking.hostName = "p14nixos";
}