{
  ...
}: let
  primary_accent = "cba6f7";
  background = "11111B";
  opacity = ".85";
in {
  home.file.".config/hypr/autostart" = {
    source = ./autostart;
    executable = true;
  };
  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    executable = true;
    recursive = true;
  };
  home.file.".config/hypr/themes" = {
    source = ./themes;
    recursive = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland = {
      enable = true;
    };
    enableNvidiaPatches = true;
    settings = {
      # "$mainMod" = "SUPER";
      monitor = [
        "DP-5, 3840x1600@120,0x0,1"
        ",preferred,auto,auto"
      ];

      input = {
        kb_layout = "gb";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;
        repeat_delay = 200;
        repeat_rate = 25;
        numlock_by_default = 1;
        accel_profile = "flat";
        sensitivity = 0;
        force_no_accel = 1;
        touchpad = {
          natural_scroll = 1;
        };
      };

      general = {
        gaps_in = 6;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgb(${primary_accent})";
        # "col.active_border" = "rgb(${background})";
        "col.inactive_border" = "rgba(${background}00)";
        layout = "master";
        apply_sens_to_raw = 1; # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
      };

      decoration = {
        rounding = 10;
        multisample_edges = true;
        shadow_ignore_window = true;
        drop_shadow = true;
        shadow_range = 15;
        shadow_render_power = 2;
        "col.shadow" = "rgb(${primary_accent})";
        # "col.shadow" = "rgb(${background})";
        "col.shadow_inactive" = "rgb(${background})";
        #blur = true;
        #blur_size = 6;
        #blur_passes = 3;
        #blur_new_optimizations = true;
        #blur_ignore_opacity = true;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          #noise = 0.0117;
          #contrast = 1.5;
          #brightness = 1;
        };
      };
      # };

      animations = {
        enabled = true;
        # Selmer443 config
        bezier = [
          "pace,0.46, 1, 0.29, 0.99"
          "overshot,0.13,0.99,0.29,1.1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
        ];
        animation = [
          "windowsIn,1,6,md3_decel,slide"
          "windowsOut,1,6,md3_decel,slide"
          "windowsMove,1,6,md3_decel,slide"
          "fade,1,10,md3_decel"
          "workspaces,1,9,md3_decel,slide"
          "workspaces, 1, 6, default"
          "specialWorkspace,1,8,md3_decel,slide"
          "border,1,1,md3_decel"
          "borderangle,1,30,md3_decel,loop"
        ];
      };

      misc = {
        vfr = true; # misc:no_vfr -> misc:vfr. bool, heavily recommended to leave at default on. Saves on CPU usage.
        vrr = false; # misc:vrr -> Adaptive sync of your monitor. 0 (off), 1 (on), 2 (fullscreen only). Default 0 to avoid white flashes on select hardware.
      };

      dwindle = {
        pseudotile = true; # enable pseudotiling on dwindle
        force_split = 0;
        preserve_split = true;
        default_split_ratio = 1.0;
        no_gaps_when_only = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
      };

      master = {
        mfact = 0.5;
        orientation = "center";
        special_scale_factor = 0.8;
        new_is_master = true;
        no_gaps_when_only = false;
      };

      gestures = {
        workspace_swipe = false;
      };

      debug = {
        damage_tracking = 2; # leave it on 2 (full) unless you hate your GPU and want to make it suffer!
      };

      exec-once = [
        "$HOME/.config/hypr/autostart"
        "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      bind = [
        # Binds
        "SUPER,Q,killactive,"
        "SUPER,M,fullscreen,"
        "SUPER,S,togglefloating,"
        "SUPER,g,togglegroup"
	      "SUPER,l,exec, hyprctl keyword general:layout 'master'"
	      "SUPER SHIFT,l,exec, hyprctl keyword general:layout 'dwindle'"
        # "SUPER,tab,changegroupactive"
        # "SUPER,P,pseudo,"
        "SUPER,o,layoutmsg, orientationnext"
        "SUPER,n,layoutmsg, cyclenext"
        # "SUPER,h,movefocus,l"
        # "SUPER,l,movefocus,r"
        # "SUPER,k,movefocus,u"
        # "SUPER,j,movefocus,d"

        "SUPER,left,movefocus,l"
        "SUPER,down,movefocus,d"
        "SUPER,up,movefocus,u"
        "SUPER,right,movefocus,r"

        #CTRL,1,workspace,1
        #CTRL,2,workspace,2
        #CTRL,3,workspace,3
        #CTRL,4,workspace,4
        #CTRL,5,workspace,5
        #CTRL,6,workspace,6
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        # "SUPER,9,workspace,9"
        # "SUPER,0,workspace,10"
        # "SUPER,z,exec,waybar"

        ################################## Move ###########################################
        # "SUPER SHIFT, H, movewindow, l"
        # "SUPER SHIFT, L, movewindow, r"
        # "SUPER SHIFT, K, movewindow, u"
        # "SUPER SHIFT, J, movewindow, d"
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"

        #---------------------------------------------------------------#
        # Move active window to a workspace with mainMod + ctrl + [0-9] #
        #---------------------------------------------------------------#
        # "SUPER $mainMod CTRL, 1, movetoworkspace, 1"
        # "SUPER $mainMod CTRL, 2, movetoworkspace, 2"
        # "SUPER $mainMod CTRL, 3, movetoworkspace, 3"
        # "SUPER $mainMod CTRL, 4, movetoworkspace, 4"
        # "SUPER $mainMod CTRL, 5, movetoworkspace, 5"
        # "SUPER $mainMod CTRL, 6, movetoworkspace, 6"
        # "SUPER $mainMod CTRL, 7, movetoworkspace, 7"
        # "SUPER $mainMod CTRL, 8, movetoworkspace, 8"
        # "SUPER $mainMod CTRL, 9, movetoworkspace, 9"
        # "SUPER $mainMod CTRL, 0, movetoworkspace, 10"
        # "SUPER $mainMod CTRL, left, movetoworkspace, -1"
        # "SUPER $mainMod CTRL, right, movetoworkspace, +1"
        # same as above, but doesnt switch to the workspace
        "SUPER $mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER $mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER $mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER $mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER $mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER $mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER $mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER $mainMod SHIFT, 8, movetoworkspacesilent, 8"
        # "SUPER $mainMod SHIFT, 9, movetoworkspacesilent, 9"
        # "SUPER $mainMod SHIFT, 0, movetoworkspacesilent, 10"

        #"SUPER,n,exec,~/.local/bin/lvim"
        #"SUPER,e,exec,emacsclient -c -a 'emacs'"

        "SUPER,RETURN,exec, kitty"
        "SUPER,E,exec, neovide -- -u '~/.local/share/lunarvim/lvim/init.lua'"
        ",Print,exec,~/.config/hypr/scripts/screenshot.sh"
        "SUPER $mainnMod SHIFT,space,exec,bemenu-run -i -l 20 --fb \"##24273a\" --ff \"##8bd5ca\" --nb \"##24273a\" --nf \"##f4dbd6\" --tb \"##24273a\" --hb \"##24273a\" --tf \"##c6a0f6\" --hf \"##8aadf4\" --nf \"##f4dbd6\" --af \"##f4dbd6\" --ab \"##24273a\""
        "SUPER,space,exec,wofi --show drun -I -s ~/.config/wofi/style.css DP-5"
        # "SUPER SHIFT,V,exec,~/.config/eww/fool_moon/bar/scripts/widgets toggle-clip"
        # "SUPER SHIFT,C,exec,~/.config/hypr/scripts/wallpaper_picker"
        # "SUPER $mainMod SHIFT,B,exec, killall -3 eww & sleep 1 && ~/.config/hypr/themes/winter/eww/launch_bar"
      ];

      bindm = [
        # Mouse binds
        # "SUPER,mouse_down,workspace,e+1"
        # "SUPER,mouse_up,workspace,e-1"
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];

      # bindle = [
      #     # Backlight Keys
      #     ",XF86MonBrightnessUp,exec,light -A 5"
      #     ",XF86MonBrightnessDown,exec,light -U 5"
      #     # Volume Keys
      #     ",XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%  "
      #     ",XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%  "
      # ];
      # bindl = [
      #     ",switch:on:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
      #     ",switch:off:Lid Switch, exec, swaylock -f -i ~/photos/wallpapers/wallpaper.png"
      # ];

      windowrule = [
        # Window rules
        "tile,title:^(kitty)$"
        "float,title:^(fly_is_kitty)$"
        "opacity 1.0 override 1.0 override,^(foot)$" # Active/inactive opacity
        "opacity 1.0 override 1.0 override,^(kitty)$" # Active/inactive opacity
        "tile,^(Spotify)$"
        "tile,^(neovide)$"
        "tile,^(wps)$"
        "opacity 1.0 override 1.0 override,^(neovide)$" # Active/inactive opacity
      ];

      windowrulev2 = [
        "opacity ${opacity} ${opacity},class:^(thunar)$"
        "opacity ${opacity} ${opacity},class:^(firefox)$"
        "opacity ${opacity} ${opacity},class:^(google-chrome)$"
        "opacity ${opacity} ${opacity},class:^(jetbrains-webstorm)$"        "opacity ${opacity} ${opacity},class:^(foot)$"
        "opacity ${opacity} ${opacity},class:^(kitty)$"
        "opacity ${opacity} ${opacity},class:^(code)$"
        # "opacity ${custom.opacity} ${custom.opacity},class:^(WebCord)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        "float,title:^(mpv)$"
        "opacity 1.0 1.0,class:^(wofi)$"
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
