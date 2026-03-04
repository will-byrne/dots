{ pkgs, hostname, lib, ... }:
{
  imports = [
    ./hyprpaper.nix
    # ./hyprlock.nix
    ./hypridle.nix
    # ./hyprsunset.nix
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
        gaps_in = 5;
        gaps_out = 10;
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
        rounding = 20;
        rounding_power = 2;
        blur = {
          enabled = true;
          special = true;
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
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
      layerrule = {
        name = "noctalia";
        "match:namespace" = "noctalia-background-.*$";
        ignore_alpha = 0.5;
        blur = true;
        blur_popups = true;
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
      "$ipc" = "noctalia-shell ipc call";

      bind = [
        # 1. Noctalia Shell
        "$mainMod, F1, exec, $ipc plugin:keybind-cheatsheet toggle # Toggle keybind cheatsheet" # Toggle keybind cheatsheet
        "$mainMod, L, exec, $ipc lockScreen lock # Lock screen with noctalia-shell" # Lock screen with noctalia-shell
        "$mainMod, A, exec, $ipc launcher toggle # Toggle noctalia-shell launcher" # Toggle noctalia-shell launcher
        "$mainMod, Z, exec, $ipc controlCenter toggle # Toggle noctalia-shell control center" # Toggle noctalia-shell control center
        "$mainMod, comma, exec, $ipc settings toggle # Toggle noctalia-shell settings" # Toggle noctalia-shell settings
        "$mainMod, M , exec, $ipc volume muteOutput # mute (alt)" # mute (alt)
        ", XF86AudioMicMute , exec, $ipc volume muteInput # mute mic" # mute mic
        ", XF86AudioMute , exec, $ipc volume muteOutput # mute sound" # mute sound
        ", XF86AudioRaiseVolume , exec, $ipc volume increase # Increase volume" # Increase volume
        ", XF86AudioLowerVolume , exec, $ipc volume decrease # Decrease volume" # Decrease volume
        ", XF86MonBrightnessUp, exec, $ipc brightness increase # Increase brightness" # Increase brightness
        ", XF86MonBrightnessDown, exec, $ipc brightness decrease # Decrease brightness " # Decrease brightness 


        # 2. Window / Session actions
        "$mainMod, Q, killactive, #Close window" #Close window
        "$mainMod, W, togglefloating # Toggle floating/tiled" # Toggle floating/tiled
        "$mainMod, G, togglegroup # Toggle window grouping" # Toggle window grouping
        # "$mainMod, L, exec, hyprlock"
        "ALT SHIFT, return, fullscreen # Toggle fullscreen (alt shift to avoid conflict with fuzzel)" # Toggle fullscreen (alt shift to avoid conflict with fuzzel)
        "$mainMod, backspace, exec, logout # Logout" # Logout
        "$mainMod, P, pseudo, # Toggle pseudotiling" # Toggle pseudotiling
        "$mainMod, U, togglesplit, # Toggle split/unsplit in stack layout" # Toggle split/unsplit in stack layout

        # 3. Move workspace
        "$mainMod SHIFT CTRL, left, workspace, e-1 # Focus workspace left" # Focus workspace left
        "$mainMod SHIFT CTRL, right, workspace, e+1 # Focus workspace right" # Focus workspace right
        "$mainMod SHIFT CTRL, down, workspace, empty # Focus new empty workspace" # Focus new empty workspace

        # 4. Move workspace to monitor
        "$mainMod CTRL ALT, left, movecurrentworkspacetomonitor, l # Move workspace to monitor left" # Move workspace to monitor left
        "$mainMod CTRL ALT, right, movecurrentworkspacetomonitor, r # Move workspace to monitor right" # Move workspace to monitor right

        # 5. Special workspace (stratchpad)
        "$mainMod ALT, s, movetoworkspacesilent, special # Move focused window to special workspace" # Move focused window to special workspace
        "$mainMod, s, togglespecialworkspace # Toggle special workspace (show/hide)" # Toggle special workspace (show/hide)

        # 6. Focus movement with arrow keys
        "$mainMod, left, movefocus, l # Focus left" # Focus left
        "$mainMod, right, movefocus, r # Focus right" # Focus right
        "$mainMod, up, movefocus, u # Focus up" # Focus up
        "$mainMod, down, movefocus, d # Focus down" # Focus down

        # 7. Swap windows
        "$mainMod CTRL, left, movewindow, l # Swap current window with left" # Swap current window with left
        "$mainMod CTRL, right, movewindow, r # Swap current window with right" # Swap current window with right
        "$mainMod CTRL, up, movewindow, u # Swap current window with up" # Swap current window with up
        "$mainMod CTRL, down, movewindow, d # Swap current window with down" # Swap current window with down

        # 8. Resize Windows
        "$mainMod SHIFT, right, resizeactive, 30 0 # Resize active window right" # Resize active window right
        "$mainMod SHIFT, left, resizeactive, -30 0 # Resize active window left" # Resize active window left
        "$mainMod SHIFT, up, resizeactive, 0 -30 # Resize active window up" # Resize active window up
        "$mainMod SHIFT, down, resizeactive, 0 30 # Resize active window down" # Resize active window down

        # 9. Workspace switching
        "$mainMod, 1, workspace, 1 # Switch to workspace 1" # Switch to workspace 1
        "$mainMod, 2, workspace, 2 # Switch to workspace 2" # Switch to workspace 2
        "$mainMod, 3, workspace, 3 # Switch to workspace 3" # Switch to workspace 3
        "$mainMod, 4, workspace, 4 # Switch to workspace 4" # Switch to workspace 4
        "$mainMod, 5, workspace, 5 # Switch to workspace 5" # Switch to workspace 5
        "$mainMod, 6, workspace, 6 # Switch to workspace 6" # Switch to workspace 6
        "$mainMod, 7, workspace, 7 # Switch to workspace 7" # Switch to workspace 7
        "$mainMod, 8, workspace, 8 # Switch to workspace 8" # Switch to workspace 8
        "$mainMod, 9, workspace, 9 # Switch to workspace 9" # Switch to workspace 9
        "$mainMod, 0, workspace, 10 # Switch to workspace 10" # Switch to workspace 10
        "$mainMod, TAB, workspace, previous # jump to last used workspace" # jump to last used workspace

        # 10. Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1 # Move focused window to workspace 1" # Move focused window to workspace 1
        "$mainMod SHIFT, 2, movetoworkspace, 2 # Move focused window to workspace 2" # Move focused window to workspace 2
        "$mainMod SHIFT, 3, movetoworkspace, 3 # Move focused window to workspace 3" # Move focused window to workspace 3
        "$mainMod SHIFT, 4, movetoworkspace, 4 # Move focused window to workspace 4" # Move focused window to workspace 4
        "$mainMod SHIFT, 5, movetoworkspace, 5 # Move focused window to workspace 5" # Move focused window to workspace 5
        "$mainMod SHIFT, 6, movetoworkspace, 6 # Move focused window to workspace 6" # Move focused window to workspace 6
        "$mainMod SHIFT, 7, movetoworkspace, 7 # Move focused window to workspace 7" # Move focused window to workspace 7
        "$mainMod SHIFT, 8, movetoworkspace, 8 # Move focused window to workspace 8" # Move focused window to workspace 8
        "$mainMod SHIFT, 9, movetoworkspace, 9 # Move focused window to workspace 9" # Move focused window to workspace 9
        "$mainMod SHIFT, 0, movetoworkspace, 10 # Move focused window to workspace 10" # Move focused window to workspace 10

        # 11. Application shortcuts
        "$mainMod, T, exec, $terminal # Open terminal" # Open terminal
        "$mainMod, E, exec, $guiFM # Open GUI file manager" # Open GUI file manager
        "$mainMod SHIFT, E, exec, $terminal -e $tuiFM # Open TUI file manager in terminal" # Open TUI file manager in terminal
        "$mainMod, C, exec, code --ozone-platform-hint=wayland # Open VSCode with Wayland support" # Open VSCode with Wayland support
        "$mainMod SHIFT, C, exec, neovide -- -u ${pkgs.lunarvim}/share/lvim/init.lua # Open neovide lunarvim" # Open neovide lunarvim
        "$mainMod, F, exec, $browser # Open web browser" # Open web browser
        "$mainMod SHIFT, F, exec, $browser --private-window # Open web browser in private mode" # Open web browser in private mode
        "CTRL SHIFT, ESCAPE, exec, $terminal -e btop # Open btop system monitor in terminal" # Open btop system monitor in terminal

        # 12. Fuzzel
        # "$mainMod, A, exec, $menu"
        "$mainMod, V, exec, cliphist list | $menu --dmenu --with-nth 2 | cliphist decode | wl-copy # Select from clipboard history" # Select from clipboard history

        # 13. Audio control
        "$mainMod SHIFT, P, exec, pavucontrol # Open audio control panel" # Open audio control panel
        # ", XF86AudioMicMute , exec, pamixer --default-source -t" # mute mic
        "$mainMod SHIFT, M , exec, pamixer --default-source -t # Mute mic (alt)" # Mute mic (alt)
        "$mainMod, M , exec, pamixer -t # Mute sound (alt)" # Mute sound (alt)
        # ", XF86AudioMute , exec, pamixer -t" # mute sound
        # ", XF86AudioLowerVolume , exec, pamixer -d 5" 
        # ", XF86AudioRaiseVolume , exec, pamixer -i 5"
        "$mainMod, F9 , exec, playerctl play-pause # Play/Pause" # Play/Pause
        "$mainMod, F10, exec, playerctl previous # Previous track" # Previous track
        "$mainMod, F11, exec, playerctl next # Next track" # Next track
        "$mainMod, F12, exec, playerctl stop # Stop playback" # Stop playback
        "$mainMod ALT, M, exec, $terminal -e rmpc # Open mpd client in terminal" # Open mpd client in terminal
        "$mainMod, Y, exec, ytmpv # Play yt video with mpd" # Play yt video with mpd

        # Brightness control
        # ", XF86MonBrightnessUp, exec, brightnessctl set +5%"y
        # ", XF86MonBrightnessDown, exec, brightnessctl set 5%-" 
        
        # 14. Screenshot bindings
        "$mainMod ALT, S, exec, grim - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy # Fullscreen screenshot" # Fullscreen screenshot
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy # Select area to screenshot" # Select area to screenshot

        # 15. Workspace scroll
        "$mainMod, mouse_down, workspace, e+1 # Scroll workspace forward" # Scroll workspace forward
        "$mainMod, mouse_up, workspace, e-1 # Scroll workspace backward" # Scroll workspace backward
      ];

      # 16.Mouse bindings
      bindm = [
        # 16.Mouse bindings
        "$mainMod, mouse:272, movewindow # Move window" # Move window
        "$mainMod, mouse:273, resizewindow # Resize window" # Resize window
      ];
    };
  };

  home.packages = with pkgs; [ hyprpicker ];
}
