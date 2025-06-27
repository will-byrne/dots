{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common
  ];
  services.tlp = {
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

  # AMD GPU
  hardware.amdgpu.amdvlk.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      vaapiVdpau

      rocmPackages.clr
      rocmPackages.clr.icd

      amdvlk

      libva
    ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };

  environment.variables = {
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      libGL
      xorg.libXrandr
      xorg.libXinerama
      xorg.libXcursor
      xorg.libXi
    ];
  };

  # Most software has the HIP libraries hard-coded. Workaround:
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  networking.hostName = "p14nixos";
}
