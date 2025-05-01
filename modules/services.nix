{ pkgs, ... }:
{
  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVENOR_ON_AC = "performance";
        CPU_SCALING_GOVENOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_ON_AC = "performance";
        CPU_ENERGY_PERF_ON_BAT = "power";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
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
    fprintd.enable = true;
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
