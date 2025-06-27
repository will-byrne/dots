{ pkgs, ... }:
{
  users = {
    users.luna = {
      isNormalUser = true;
      description = "luna";
      initialPassword = "rose";
      home = "/home/luna";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "video"
        "storage"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
    };
  };
}