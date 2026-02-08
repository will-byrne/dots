{ hostname, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../optional/amd.nix
  ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Needed so users can read hwmon without sudo
  services.udev.extraRules = ''
    KERNEL=="hwmon*", MODE="0644"
  '';
  networking.firewall.allowedTCPPorts = [ 5001 ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
      vulkan-loader
    ];
  };

  hardware.amdgpu.opencl.enable = true;

  systemd.tmpfiles.rules = 
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        rocm-smi
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];

  hardware.amdgpu.initrd.enable = true;
  networking.hostName = hostname;
}
