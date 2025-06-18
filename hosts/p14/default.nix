{
  imports = [
    ./1password.nix
    ./catppuccin.nix
    ./hardware-configuration.nix
    ./users.nix
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.thunar.enable = true;
  services.blueman.enable = true;

  
  networking.hostName = "p14nixos";
}