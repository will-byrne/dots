wallpaper_folder=$HOME/wallpapers
wallpaper_location="$(ls $wallpaper_folder | wofi -n --show dmenu)"
if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
    wallpaper_temp="$wallpaper_location"
elif [[ -f $wallpaper_folder/$wallpaper_location ]]; then
    swww img $wallpaper_folder/$wallpaper_temp/$wallpaper_location --transition-type random --transition-pos "$(hyprctl cursorpos)" --transition-duration 3
else
    exit 1
fi