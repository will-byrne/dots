{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  
  security = {
    doas = {
      enable = true;
      wheelNeedsPassword = true;
      extraRules = [
        {
          users = ["luna"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
    polkit.enable = true;
  };

  zramSwap.enable = true;

  console.keyMap = "uk";

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?

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

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  # home-manager.backupFileExtension = "backup";
  environment = {
    shells = [ pkgs.bashInteractive ];
    systemPackages = with pkgs; [
      lact
      vim
      wget
      curl
      git
      usbutils
      udiskie
      udisks
    ];
    variables.EDITOR = "vim";
  };
}
