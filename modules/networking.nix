{
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
  };
}
 