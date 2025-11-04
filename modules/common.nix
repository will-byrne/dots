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

  hardware.opentabletdriver.enable = true;

  zramSwap.enable = true;

  console.keyMap = "uk";

  nix = {
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 500000000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.alvr.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.thunar.enable = true;
  services.blueman.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?

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
