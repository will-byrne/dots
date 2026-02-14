{ pkgs, hostname, lib, ... }:
{
  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprsunset.nix
    ./hyprpolkit.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      xwayland.force_zero_scaling = true;
      
      exec-once = lib.mkMerge [
        [
          "waybar"
          "mpdscribble"
          "wl-paste  --type text --watch cliphist store"
        ]
        (lib.mkIf (hostname== "desktop") [
          "[workspace 9 silent; fullscreen]$terminal --class -e btop"
        ])
      ];

      monitor = lib.mkMerge [
        (lib.mkIf (hostname == "desktop") [
          "DP-1, 3840x1600@120, 0x0, 1, vrr, 1, bitdepth, 10"
          "DP-2, 3840x1100, 3840x0, 2, transform, 3"
        ])
        (lib.mkIf (hostname == "p14") [
          ",preferred,auto,1"
        ])
      ];

      workspace = lib.mkMerge [
        (lib.mkIf (hostname== "desktop") [
          "1, monitor:DP-1"
          "2, monitor:DP-1"
          "3, monitor:DP-1"
          "4, monitor:DP-1"
          "5, monitor:DP-1"
          "6, monitor:DP-1"
          "7, monitor:DP-1"
          "8, monitor:DP-1"
          "9, monitor:DP-2"
        ])
        (lib.mkIf (hostname == "p14") [])
      ];

      input = {
        kb_layout = "gb";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.0;
        touchpad = {
          natural_scroll = true;
        };
      };

      # Per device overrides
      device = [
        {
          name = "cx-2.4g-wireless-receiver";
          kb_layout = "us";
        }
        {
          name = "ilitek-------ilitek-touch";
          enabled = false;
        }
      ];

      gestures = {
        gesture = "3, horizontal, workspace";
      };

      general = {
        gaps_in = 3;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        layout = "dwindle";
        resize_on_border = true;
        allow_tearing = true;
      };

      group = {
        "col.border_active" = "rgba(F8032Aff) rgba(52292Fff) 45deg";
        "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          special = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, linear"
          "borderangle, 1, 30, linear, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
          "specialWorkspace, 1, 5, wind, slidevert"
        ];
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "linear, 1, 1, 1, 1"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Adwaita"
        "GTK_THEME,Catppuccin-GTK-Pink-Dark-Macchiato"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
        "TERMINAL,kitty"
        "EDITOR,lvim"
        "SHELL,zsh"
      ];

      windowrule = [ 
        "no_blur on, match:title ^()$, match:class ^()$"
      ];

      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$guiFM" = "thunar";
      "$tuiFM" = "yazi";
      "$menu" = "fuzzel";
      "$browser" = "firefox";

      bind = [
        # Window / Session actions
        "$mainMod, Q, killactive,"
        "$mainMod, W, togglefloating"
        "$mainMod, G, togglegroup"
        "$mainMod, L, exec, hyprlock"
        "ALT SHIFT, return, fullscreen"
        "$mainMod, backspace, exec, logout"
        "$mainMod, P, pseudo,"
        "$mainMod, U, togglesplit,"

        # Move workspace
        "$mainMod CTRL, left, workspace, e-1"
        "$mainMod CTRL, right, workspace, e+1"
        "$mainMod CTRL, down, workspace, empty"

        # Move workspace to monitor
        "$mainMod CTRL ALT, left, movecurrentworkspacetomonitor, l"
        "$mainMod CTRL ALT, right, movecurrentworkspacetomonitor, r"

        # Special workspace (stratchpad)
        "$mainMod ALT, s, movetoworkspacesilent, special"
        "$mainMod, s, togglespecialworkspace"

        # Focus movement with vim keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Swap windows
        "$mainMod SHIFT CTRL, left, movewindow, l"
        "$mainMod SHIFT CTRL, right, movewindow, r"
        "$mainMod SHIFT CTRL, up, movewindow, u"
        "$mainMod SHIFT CTRL, down, movewindow, d"

        # Resize Windows
        "$mainMod SHIFT, right, resizeactive, 30 0"
        "$mainMod SHIFT, left, resizeactive, -30 0"
        "$mainMod SHIFT, up, resizeactive, 0 -30"
        "$mainMod SHIFT, down, resizeactive, 0 30"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, TAB, workspace, previous" # jump to last used workspace

        # Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Application shortcuts
        "$mainMod, T, exec, $terminal"
        "$mainMod, E, exec, $guiFM"
        "$mainMod SHIFT, E, exec, $terminal -e $tuiFM"
        "$mainMod, C, exec, code --ozone-platform-hint=wayland"
        "$mainMod SHIFT, C, exec, neovide -- -u ${pkgs.lunarvim}/share/lvim/init.lua" # open neovide lunarvim
        "$mainMod, F, exec, $browser"
        "$mainMod SHIFT, F, exec, $browser --private-window"
        "CTRL SHIFT, ESCAPE, exec, $terminal -e btop"

        # Fuzzel
        "$mainMod, A, exec, $menu"
        "$mainMod, V, exec, cliphist list | $menu --dmenu --with-nth 2 | cliphist decode | wl-copy"

        # Audio control
        "$mainMod SHIFT, P, exec, pavucontrol"  
        ", XF86AudioMicMute , exec, pamixer --default-source -t" # mute mic
        "$mainMod SHIFT, M , exec, pamixer --default-source -t" # mute mic (alt)
        "$mainMod, M , exec, pamixer -t" # mute (alt)
        ", XF86AudioMute , exec, pamixer -t" # mute sound
        ", XF86AudioLowerVolume , exec, pamixer -d 5" 
        ", XF86AudioRaiseVolume , exec, pamixer -i 5"
        "$mainMod, F9 , exec, playerctl play-pause"
        "$mainMod, F10, exec, playerctl previous"
        "$mainMod, F11, exec, playerctl next"
        "$mainMod, F12, exec, playerctl stop"
        "$mainMod ALT, M, exec, $terminal -e rmpc"
        "$mainMod, Y, exec, ytmpv" # play yt video with mpd

        # Brightness control
        ", XF86MonBrightnessUp, exec, brightnessctl set +15%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 15%-" 

        # Screenshot bindings
        "$mainMod ALT, S, exec, grim - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"

        # Workspace scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  home.packages = with pkgs; [ hyprpicker ];
}
