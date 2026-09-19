{ pkgs, lib, ... }:
{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    fwupd.enable = true;
    ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      loadModels = [ "llama3.2:1b" ];
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      extraConfig.pipewire."99-clock-rates" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [
            44100
            88200
            176400
            48000
            96000
          ];
        };
      };
    };
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 ];
    };
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "dur_file"; # Options: "matrix", "fire", or "none"
        dur_file_path = "/etc/ly/blackhole.dur";
        bigclock = true;
        clock = "%F %R"; # Displays date and time at the top
        save = true; # Remembers your username and last session choice
        wayland_spec = true; # Crucial for routing UWSM environment handoffs
        # --- CATPPUCCIN MACCHIATO COLOR THEME ---

        # Transparent Background (Let's the animation render cleanly)
        bg = "0x00000000";
        box_bg = "0x00000000";

        # Foreground Elements (Catppuccin Macchiato Text: #cad3f5)
        fg = "0x40cad3f5";

        # Box Border & Focus Highlights (Catppuccin Macchiato Pink: #f5bde6)
        box_fg = "0x40f5bde6";
      };
    };
  };
  environment.etc."ly/blackhole.dur".source = ./blackhole-smooth.dur;
  systemd.services.ollama.wantedBy = lib.mkForce [ ]; # Don't auto-start on boot
  systemd.services.ollama-model-loader.wantedBy = lib.mkForce [ ]; # Don't auto-start on boot
}
