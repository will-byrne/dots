{
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
    hostName = "p14nixos"; # Define your hostname.
  };
}
 