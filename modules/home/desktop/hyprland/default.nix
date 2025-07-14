{ pkgs, ... }:
{
  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      xwayland.force_zero_scaling = true;
      
      exec-once = [
        "waybar"
        "mpdscribble"
      ];

      monitor = [ ",preferred,auto,1" ];

      input = {
        kb_layout = "gb";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      general = {
        gaps_in = 3;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        layout = "dwindle";
        resize_on_border = true;
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
        "GTK_THEME,catppuccin-macchiato-pink-standard+normal"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
        "TERMINAL,kitty"
        "EDITOR,lvim"
        "SHELL,zsh"
      ];

      windowrule = [ ];

      windowrulev2 = [ "noblur,title:^()$,class:^()$" ];

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

        # Audio control
        "$mainMod SHIFT, P, exec, pavucontrol"  
        ", XF86AudioMicMute , exec, pamixer --default-source -t" # mute mic
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

        # Focus movement with vim keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Swap windows
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Resize Windows
        "$mainMod ALT, l, resizeactive, 30 0"
        "$mainMod ALT, h, resizeactive, -30 0"
        "$mainMod ALT, k, resizeactive, 0 -30"
        "$mainMod ALT, j, resizeactive, 0 30"

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
