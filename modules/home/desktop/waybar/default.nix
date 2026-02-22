{ pkgs, hostname, ...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        output = [ "DP-1" "eDP-1" ];
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "battery"
          "cpu"
          "temperature"
          "memory"
          "disk"
          "backlight"
          "network"
          "bluetooth"
          "pulseaudio"
          "pulseaudio#microphone"
          "custom/weather"
          "clock"
          "tray"
          "custom/power"
        ];

        "hyprland/window" = {
          format = "{}";
        };

        "custom/weather" = {
          format = "{}°";
          tooltip = true;
          interval = 60;
          exec = "wttrbar --location Burwell --observation-time";
          return-type = "json";
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = "Power menu";
          on-click = "powermenu";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          all-outputs = true;
          on-click = "activate";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "cpu" = {
          interval = 1;
          format = "  {}%";
        };

        "temperature" = {
          format = " {temperatureC}°C";
          hwmon-path = if hostname == "desktop" then "/sys/class/hwmon/hwmon3/temp1_input" else if hostname == "p14" then "/sys/class/hwmon/hwmon5/temp1_input" else null;
        };

        "memory" = {
          interval = 1;
          format = "  {}%";
        };

        "disk" = {
          interval = 30;
          format = "🖴 {percentage_used}%";
          path = "/";
        };

        "clock" = {
          format = "󰃰  {:%a, %b %e %H:%M }";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "backlight" = {
          device = "intel_backlight";
          rotate = 0;
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          min-length = 6;
        };

        "battery" = {
          interval = 5;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-right-click = "pavucontrol";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [ " " " " " " ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍮 {volume}%";
          format-source-muted = "󰍮 Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };

        "network" = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "{ipaddr} 모";
          tooltip-format = "{essid} - {ifname} via {gwaddr} 🖧";
          format-linked = "{ifname} (No IP) ⚠";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}:{essid} {ipaddr}/{cidr}";
        };

        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections}";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };

        "mpris" = {
          title-len = 40;
          interval = 1;
          album-len = 0;
          max-len = 60;
          max-empty-time = 60;
          format = "{player_icon} {artist} - {title}";
          format-paused = "{player_icon} {artist} - {title}";
          player-icons = {
            default = "▶";
            mpv = "🎵";
            spotify = " ";
            spotify-player = " ";
            firefox = "";
          };
          status-icons = {
            paused = "";
          };
          ignored-players = [ "librewolf" "vlc" "firefox" "brave" ];
        };

        "mpd" = {
          format = "{stateIcon} {artist} - {title}";
          format-disconnected = "Disconnected ";
          format-stopped = "{stateIcon} {artist} - {title}";
          format-empty = "";
          interval = 1;
          on-click = "mpc toggle";
          consume-icons = {
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = " 1 ";
          };
          state-icons = {
            paused = " ";
            playing = " ";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
      }
    ];

    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: "Iosevka Nerd Font";
        font-weight: 600;
        font-size: 14px;
        min-height: 0;
        opacity: 1.0;
      }

      window#waybar {
          background: none;
      }

      tooltip {
        background: #1a1b26;
        border-radius: 7px;
        border-width: 2px;
        border-style: solid;
        border-color: #11111b;
        opacity: 1.0;
      }

      #workspaces button {
        padding: 5px;
        color: #313244;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #89b4fa;
        background: #1a1b26;
      }

      #workspaces button.focused {
        color: #707880;
        background: #eba0ac;
        border-radius: 7px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #f28fad;
        border-radius: 7px;
        opacity: 0.5;
      }

      #workspaces button:hover {
        background: #11111b;
        color: #c0caf5;
        border-radius: 17px;
      }

      #window,
      #clock,
      #battery,
      #disk,
      #mpris,
      #pulseaudio,
      #custom-pacman,
      #network,
      #bluetooth,
      #backlight,
      #temperature,
      #workspaces,
      #tray,
      #mpd,
      #custom-pomodoro,
      #cpu,
      #memory,
      #custom-spotify,
      #custom-weather,
      #custom-power,
      #modbackground {
        background: #1a1b26;
        opacity: 1.0;
        padding: 0px 7px;
        margin-top: 5px;
      }

      #backlight {
        color: #91d7e3;
        border-radius: 7px 7px 7px 7px;
        margin-right: 5px;
      }

      #custom-weather {
        color: #f5bde6;
        border-radius: 7px 7px 7px 7px;
        margin-right: 5px;
      }

      #pulseaudio {
        color: #89b4fa;
        border-radius: 0px;
        border-left: 0px;
        border-radius: 7px 0px 0px 7px;
        border-right: 0px;
      }

      #pulseaudio.microphone {
        color: #cba6f7;
        border-left: 0px;
        border-right: 0px;
        border-radius: 0px 7px 7px 0px;
        margin-right: 5px;
      }

      #cpu {
        color: #89dceb;
        border-radius: 7px 0px 0px 7px;
      }

      #temperature {
        color: #ed8796;
      }

      #memory {
        color: #94e2d5;
      }

      #disk {
        color: #c6a0f6;
        border-radius: 0px 7px 7px 0px;
        margin-right: 5px;
        padding-top: 4px;
      }

      #tray {
        border-radius: 7px;
        margin-right: 5px;
      }

      #custom-power {
        border-radius: 7px;
        margin-right: 5px;
        color: #ee99a0;
      }

      #workspaces {
        background: #1a1b26;
        border-radius: 7px;
        margin-left: 5px;
        padding-right: 5px;
        padding-left: 5px;
        opacity: 1.0;
      }

      #window {
        color: #f5bde6;
        border-radius: 7px;
        margin-left: 10px;
        margin-right: 60px;
        opacity: 1.0;
      }

      #clock {
        color: #fab387;
        border-radius: 7px;
        margin-right: 5px;
        padding-right: 0px;
        border-right: 0px;
        opacity: 1.0;
      }

      #network {
        color: #f9e2af;
        border-radius: 7px;
        margin-right: 5px;
        border-left: 0px;
        border-right: 0px;
        opacity: 1.0;
      }

      #bluetooth {
        color: #89b4fa;
        border-radius: 7px;
        margin-right: 5px;
        opacity: 1.0;
      }

      #battery {
        color: #a6e3a1;
        border-radius: 7px;
        margin-right: 5px;
        border-left: 0px;
      }

      #custom-spotify {
        border-radius: 7px;
        margin-right: 5px;
        border-right: 0px;
        opacity: 1.0;
      }

      #mpris {
        color: #c0caf5;
        border-radius: 7px;
        margin-right: 5px;
        border-right: 0px;
      }

      #mpris.paused {
        color: #c0caf5;
        border-bottom: 2px solid yellow;
      }

      #mpd {
        color: #c0caf5;
        border-radius: 7px;
        margin-right: 5px;
        border-right: 0px;
      }

      #mpd.paused {
        color: #c0caf5;
        border-bottom: 2px solid yellow;
      }
    '';
  };

  home.packages = with pkgs; [
    wttrbar
    (pkgs.writeShellScriptBin "powermenu" ''
      choice=$(printf "󰌾 Lock\n󰍃 Logout\n󰜉 Reboot\n󰐥 Shutdown" | fuzzel --dmenu --prompt="⏻  Power")

      case "$choice" in
        *Lock)
          hyprlock
          ;;
        *Logout)
          hyprctl dispatch exit
          ;;
        *Reboot)
          systemctl reboot
          ;;
        *Shutdown)
          systemctl poweroff
          ;;
      esac
    '')
  ];
}
