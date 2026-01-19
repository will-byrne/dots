{ pkgs, ... }:
{
  services = {
    fwupd.enable = true;
    ollama = {
      enable = true;
      loadModels = [ "llama3.2:1b" ];
    };
    open-webui = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    printing = {
      enable = true; 
      drivers = [ pkgs.cnijfilter2 ];
    };
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    displayManager = {
      enable = true;
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };
  };
}
