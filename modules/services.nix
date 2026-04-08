{ pkgs, lib, ... }:
{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    fwupd.enable = true;
    ollama = {
      enable = true;
      loadModels = [ "llama3.2:1b" ];
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
    blueman.enable = true;
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
  systemd.services.ollama.wantedBy = lib.mkForce [];  # Don't auto-start on boot
  systemd.services.ollama-model-loader.wantedBy = lib.mkForce [];  # Don't auto-start on boot
}
