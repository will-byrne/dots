{ pkgs, ...}: {
  programs.waybar = {
    enable = true;
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

  xdg.configFile = {
    "waybar/config".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
  };
}
