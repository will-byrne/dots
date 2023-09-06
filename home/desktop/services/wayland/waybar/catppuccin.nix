''
{
    "layer": "top", // Waybar at top layer
    // "position": "left", // Waybar position (top|bottom|left|right)
    "height": 35, // Waybar height (to be removed for auto height)
    // "width": 1280, // Waybar width
    "spacing": 4, // Gaps between modules (4px)
    // Choose the order of the modules
    "modules-left": ["wlr/workspaces"], 
    "modules-center": ["custom/playerlabel"],
    "modules-right": ["pulseaudio", "network", "cpu", "memory", "clock", "custom/background", "tray"],
    // Modules configuration 
    "custom/playerlabel": {
      "format": "<span>󰎈 {} </span>",
      "return-type": "json",
      "max-length": 40,
      "exec": "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}}: {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F",
      "on-click": "playerctl play-pause"
    },
    "custom/background": {
      "format": "<span font='14'>🖼</span>",
      "on-click": "sh ~/.config/waybar/scripts/wall-paper.sh",
      "on-click-right": "notify-send -t 1 'swww' '1' & ~/flake/home/desktop/graphical/wms/hyprland/scripts/wall"
    },
    "wlr/workspaces": {
      "active-only": false,
      "all-outputs": false,
      "disable-scroll": false,
      "format": "{icon}",
      "on-click": "activate",
      "format-icons": {
        "urgent": "",
        "active": "",
        "default": ""
      },
      "sort-by-number": true,
      "on-scroll-down": "hyprctl dispatch workspace e+1",
      "on-scroll-up": "hyprctl dispatch workspace e-1"
    },
    "tray": {
        // "icon-size": 21,
        "spacing": 10,
    },
    "clock": {
        // "timezone": "America/New_York",
        "format": " {:%H:%M} <span font='14'></span>",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "{:%Y-%m-%d}"
    },
    "cpu": {
        "format": "{usage}% <span font='14'>󰻠</span>"
    },
    "memory": {
        "format": "{}% <span font='14'>󰍛</span>"
    },
    "network": {
        // "interface": "wlp2*", // (Optional) To force the use of this interface
        "format-wifi": "{essid} ({signalStrength}%) <span font='14'>󰖩</span>",
        "format-ethernet": "Connected <span font='14'>󰈁</span>",
        "tooltip-format": "{ifname} via {gwaddr}/{cidr}",
        "format-linked": "{ifname} (No IP) <span font='14'>󰈁</span>",
        "format-disconnected": "Disconnected <span font='14'>󰈂</span>",
        "format-alt": "{ipaddr}"
    },
    "pulseaudio": {
        // "scroll-step": 1, // %, can be a float
        "format": "{volume}% <span font='14'>{icon}</span>",
        "format-bluetooth": "{volume}% <span font='14'>{icon}</span>",
        "format-bluetooth-muted": "<span font='14'>󰖁</span>",
        "format-muted": "<span font='14'>󰖁</span>",
        "format-source": "{volume}% <span font='14'>󰕾</span>",
        "format-source-muted": "<span font='14'>󰖁</span>",
        "format-icons": {
            "headphone": "",
            "hands-free": "󰋎",
            "headset": "󰕾",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click-right": "pavucontrol",
        "on-click": "sh ~/.config/waybar/scripts/volume.sh mute",
        "on-scroll-up": "sh ~/.config/waybar/scripts/volume.sh up",
        "on-scroll-down": "sh ~/.config/waybar/scripts/volume.sh down"
    }
}
''
