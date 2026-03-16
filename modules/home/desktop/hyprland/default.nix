{ pkgs, hostname, lib, ... }:
let
  mkBind = combo: action: desc: { inherit combo action desc; };

  keybindSections = [

    # 1. Noctalia Shell
    {
      id = 1;
      name = "Noctalia Shell";
      binds = [
        (mkBind "$mainMod, F1" "exec, $ipc plugin:keybind-cheatsheet toggle" "Toggle keybind cheatsheet")
        (mkBind "$mainMod, L" "exec, $ipc lockScreen lock" "Lock screen")
        (mkBind "$mainMod, A" "exec, $ipc launcher toggle" "Toggle launcher")
        (mkBind "$mainMod, Z" "exec, $ipc controlCenter toggle" "Toggle control center")
        (mkBind "$mainMod, comma" "exec, $ipc settings toggle" "Toggle settings")
        (mkBind "$mainMod, M" "exec, $ipc volume muteOutput" "Mute output")
        (mkBind ", XF86AudioMicMute" "exec, $ipc volume muteInput" "Mute mic")
        (mkBind ", XF86AudioMute" "exec, $ipc volume muteOutput" "Mute sound")
        (mkBind ", XF86AudioRaiseVolume" "exec, $ipc volume increase" "Volume up")
        (mkBind ", XF86AudioLowerVolume" "exec, $ipc volume decrease" "Volume down")
        (mkBind ", XF86MonBrightnessUp" "exec, $ipc brightness increase" "Brightness up")
        (mkBind ", XF86MonBrightnessDown" "exec, $ipc brightness decrease" "Brightness down")
        (mkBind ", switch:on:Lid Switch" "exec, $ipc sessionMenu lockAndSuspend" "Lock screen and suspend on lid close")
      ];
    }

    # 2. Window / Session
    {
      id = 2;
      name = "Window / Session actions";
      binds = [
        (mkBind "$mainMod, Q" "killactive" "Close window")
        (mkBind "$mainMod, W" "togglefloating" "Toggle floating")
        (mkBind "$mainMod, G" "togglegroup" "Toggle grouping")
        (mkBind "ALT SHIFT, return" "fullscreen" "Toggle fullscreen")
        (mkBind "$mainMod, backspace" "exec, logout" "Logout")
        (mkBind "$mainMod, P" "pseudo" "Toggle pseudotile")
        (mkBind "$mainMod, U" "togglesplit" "Toggle split")
      ];
    }

    # 3. Move workspace
    {
      id = 3;
      name = "Move workspace focus";
      binds = [
        (mkBind "$mainMod SHIFT CTRL, left" "workspace, e-1" "Workspace left")
        (mkBind "$mainMod SHIFT CTRL, right" "workspace, e+1" "Workspace right")
        (mkBind "$mainMod SHIFT CTRL, down" "workspace, empty" "New empty workspace")
      ];
    }

    # 4. Move workspace to monitor
    {
      id = 4;
      name = "Move workspace to monitor";
      binds = [
        (mkBind "$mainMod CTRL ALT, left" "movecurrentworkspacetomonitor, l" "Move workspace left monitor")
        (mkBind "$mainMod CTRL ALT, right" "movecurrentworkspacetomonitor, r" "Move workspace right monitor")
      ];
    }

    # 5. Special workspace
    {
      id = 5;
      name = "Special workspace";
      binds = [
        (mkBind "$mainMod SHIFT, s" "movetoworkspacesilent, special" "Move to special workspace")
        (mkBind "$mainMod, s" "togglespecialworkspace" "Toggle special workspace")
      ];
    }

    # 6. Focus movement
    {
      id = 6;
      name = "Focus movement";
      binds = [
        (mkBind "$mainMod, left" "movefocus, l" "Focus left")
        (mkBind "$mainMod, right" "movefocus, r" "Focus right")
        (mkBind "$mainMod, up" "movefocus, u" "Focus up")
        (mkBind "$mainMod, down" "movefocus, d" "Focus down")
      ];
    }

    # 7. Swap windows
    {
      id = 7;
      name = "Swap windows";
      binds = [
        (mkBind "$mainMod CTRL, left" "movewindow, l" "Swap left")
        (mkBind "$mainMod CTRL, right" "movewindow, r" "Swap right")
        (mkBind "$mainMod CTRL, up" "movewindow, u" "Swap up")
        (mkBind "$mainMod CTRL, down" "movewindow, d" "Swap down")
      ];
    }

    # 8. Resize
    {
      id = 8;
      name = "Resize windows";
      binds = [
        (mkBind "$mainMod SHIFT, right" "resizeactive, 30 0" "Resize right")
        (mkBind "$mainMod SHIFT, left" "resizeactive, -30 0" "Resize left")
        (mkBind "$mainMod SHIFT, up" "resizeactive, 0 -30" "Resize up")
        (mkBind "$mainMod SHIFT, down" "resizeactive, 0 30" "Resize down")
      ];
    }

    # 9. Workspace switching
    {
      id = 9;
      name = "Workspace switching";
      binds =
        (builtins.genList (i:
          mkBind "$mainMod, ${toString (i + 1)}"
                "workspace, ${toString (i + 1)}"
                "Switch to workspace ${toString (i + 1)}"
        ) 9)
        ++ [
          (mkBind "$mainMod, 0" "workspace, 10" "Switch to workspace 10")
          (mkBind "$mainMod, TAB" "workspace, previous" "Previous workspace")
        ];
    }

    # 10. Move to workspace
    {
      id = 10;
      name = "Move window to workspace";
      binds =
        (builtins.genList (i:
          mkBind "$mainMod SHIFT, ${toString (i + 1)}"
                "movetoworkspace, ${toString (i + 1)}"
                "Move to workspace ${toString (i + 1)}"
        ) 9)
        ++ [
          (mkBind "$mainMod SHIFT, 0" "movetoworkspace, 10" "Move to workspace 10")
        ];
    }

    # 11. Applications
    {
      id = 11;
      name = "Applications";
      binds = [
        (mkBind "$mainMod, T" "exec, $terminal" "Open terminal")
        (mkBind "$mainMod, E" "exec, $guiFM" "Open GUI file manager")
        (mkBind "$mainMod SHIFT, E" "exec, $terminal -e $tuiFM" "Open TUI file manager")
        (mkBind "$mainMod, C" "exec, code --ozone-platform-hint=wayland" "Open VSCode")
        (mkBind "$mainMod SHIFT, C" "exec, neovide" "Open Neovide")
        (mkBind "$mainMod, F" "exec, $browser" "Open browser")
        (mkBind "$mainMod SHIFT, F" "exec, $browser --private-window" "Browser private")
        (mkBind "CTRL SHIFT, ESCAPE" "exec, $terminal -e btop" "System monitor")
      ];
    }

    # 12. Clipboard
    {
      id = 12;
      name = "Clipboard";
      binds = [
        # (mkBind "$mainMod, V" "exec, cliphist list | $menu --dmenu --with-nth 2 | cliphist decode | wl-copy" "Clipboard history")
        (mkBind "$mainMod, V" "exec, $ipc launcher clipboard" "Clipboard history")
      ];
    }

    # 13. Audio
    {
      id = 13;
      name = "Audio control";
      binds = [
        (mkBind "$mainMod SHIFT, P" "exec, pavucontrol" "Audio control panel")
        (mkBind "$mainMod SHIFT, M" "exec, pamixer --default-source -t" "Mute mic")
        (mkBind "$mainMod, M" "exec, pamixer -t" "Mute output")
        (mkBind "$mainMod, F9" "exec, playerctl play-pause" "Play/Pause")
        (mkBind "$mainMod, F10" "exec, playerctl previous" "Previous track")
        (mkBind "$mainMod, F11" "exec, playerctl next" "Next track")
        (mkBind "$mainMod, F12" "exec, playerctl stop" "Stop playback")
        (mkBind "$mainMod ALT, M" "exec, $terminal -e rmpc" "Open MPD client")
        (mkBind "$mainMod, Y" "exec, ytmpv" "Play YouTube via MPD")
      ];
    }

    # 14. Screenshots
    {
      id = 14;
      name = "Screenshots";
      binds = [
        (mkBind "$mainMod ALT, S"
          "exec, grim - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"
          "Fullscreen screenshot")
        (mkBind "$mainMod SHIFT, S"
          "exec, grim -g \"$(slurp)\" - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"
          "Selection screenshot")
      ];
    }

    # 15. Workspace scroll
    {
      id = 15;
      name = "Workspace scroll";
      binds = [
        (mkBind "$mainMod, mouse_down" "workspace, e+1" "Scroll forward")
        (mkBind "$mainMod, mouse_up" "workspace, e-1" "Scroll backward")
      ];
    }
  ];

  mouseBinds = [
    (mkBind "$mainMod, mouse:272" "movewindow" "Move window")
    (mkBind "$mainMod, mouse:273" "resizewindow" "Resize window")
  ];

  renderSection = section: ''
    # ${toString section.id}. ${section.name}
    ${lib.concatMapStrings (b:
      "bind = ${b.combo}, ${b.action} #\"${b.desc}\"\n"
    ) section.binds}
  '';

  renderMouse = ''
    # 16. Mouse bindings
    ${lib.concatMapStrings (b:
      "bindm = ${b.combo}, ${b.action} #\"${b.desc}\"\n"
    ) mouseBinds}
  '';

in
{
  xdg.configFile."hypr/hyprland.conf".force = true;

  imports = [
    # ./hyprpaper.nix
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
          # "wl-paste  --type text --watch cliphist store"
        ]
        (lib.mkIf (hostname== "desktop") [
          "[workspace 9 silent; fullscreen]$terminal --class -e btop"
        ])
      ];

      monitor = lib.mkMerge [
        (lib.mkIf (hostname == "desktop") [ # DP-1 is the main monitor 3840/1600, DP-2 is the secondary
          "DP-1, 3840x1600@120, 0x0, 1, vrr, 1, bitdepth, 10"
          "DP-2, 3840x1100, 3840x0, 2, transform, 3"
        ])
        (lib.mkIf (hostname == "p14") [ # eDP-1 is the built-in display 1920/1200
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
        "GTK_THEME,adw-gtk3-dark"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
        "TERMINAL,kitty"
        "EDITOR,nvim"
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

      extraConfig =
        "\n"
        + lib.concatMapStrings renderSection keybindSections
        + "\n"
        + renderMouse;
    };
  };

  home.packages = with pkgs; [ hyprpicker ];
}
