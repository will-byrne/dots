# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  final,
  prev,
  inputs,
  packages,
  nixpkgs-unstable,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    # Kernel Modules
    kernelModules = ["v4l2loopback" "usb.autosuspend=1"]; # Autostart kernel modules on boot
    kernelParams = [ "i8042.dumbkbd=1" ];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback]; # loopback module to make OBS virtual camera work
    loader = {
      systemd-boot.enable = false;
      timeout = 10;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        gfxmodeEfi = "1280x720x32";
        configurationLimit = 3;
        theme = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
          sha256 = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
        } + "/src/catppuccin-macchiato-grub-theme";
      };
    };
  };

  # Change systemd stop job timeout in NixOS configuration (Default = 90s)
  systemd = {
    services.NetworkManager-wait-online.enable = false;
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    # no need to wait interfaces to have an IP to continue booting
    dhcpcd.wait = "background";
    # avoid checking if IP is already taken to boot a few seconds faster
    dhcpcd.extraConfig = "noarp";
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
      defaultSession = "hyprland";
    };
    desktopManager.mate.enable = true;
  };
  systemd.services."display-manager".after = [ "network-online.target" "systemd-resolved.service" ];

  # Enables services
  services.logmein-hamachi.enable = false;
  services.flatpak.enable = true;
  services.blueman.enable = true;

  # Enable programs
  programs = {
    zsh.enable = true;
    steam.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      enableNvidiaPatches = true;
    };
  };

  # Use overlays
  nixpkgs.overlays = [
    (
      final: prev: {
        sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
          pname = "sf-mono-liga-bin";
          version = "dev";
          src = inputs.sf-mono-liga-src;
          dontConfigure = true;
          installPhase = ''
            mkdir -p $out/share/fonts/opentype
            cp -R $src/*.otf $out/share/fonts/opentype/
          '';
        };
      }
    )
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      sf-mono-liga-bin
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["CaskaydiaCove Nerd Font Mono"];
        sansSerif = ["CaskaydiaCove Nerd Font Mono"];
        monospace = ["CaskaydiaCove Nerd Font Mono"];
      };
    };
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enables docker in rootless mode
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Enables virtualization for virt-manager and virtual box
  virtualisation = {
    libvirtd.enable = true;
  };
  # users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "0"; # Controls if Adaptive Sync should be used. Recommended to set as “0” to avoid having problems on some games.
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

#  services.hardware.openrgb = {
#    enable = true;
#    package = nixpkgs-unstable.openrgb-with-all-plugins;
#  };

  hardware = {
    bluetooth = {
      enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
    };
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  users = {
    users = {
      luna = {
        isNormalUser = true;
        description = "luna";
        initialPassword = "rose";
        shell = pkgs.zsh;
        extraGroups = ["networkmanager" "wheel" "input" "docker" "libvirtd"];
      };
    };
  };

  # Use doas instead-of sudo
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
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    playerctl
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

  environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.google-chrome}/bin/google-chrome-stable";

  # Enables flakes + garbage collector
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    settings = {
      auto-optimise-store = true;
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
