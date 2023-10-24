{
  inputs,
  config,
  pkgs,
  nixpkgs-unstable,
  ...
}: {
  home.packages = [
    # Design
    pkgs.figma-linux

    # Useful utils
    pkgs.fd # A simple, fast and user-friendly alternative to find
    pkgs.jq # A lightweight and flexible command-line JSON processor
    pkgs.eza # Replacement for ls in rust
    pkgs.fzf # Fuzzy finder
    pkgs.zoxide # Improved cd command
    pkgs.rm-improved # Replacement for rm with focus on safety, ergonomics and performance
    nixpkgs-unstable.zoom-us

    # System Utils
    pkgs.mpd
    pkgs.mpv
    pkgs.w3m
    pkgs.libsixel # Dependency for neofetch so it displays images
    pkgs.imagemagick # Dependency for neofetch so it displays images
    # glib # C library of programming buildings blocks
    # glibc
    pkgs.file
    pkgs.fuse
    pkgs.tree
    pkgs.peek
    pkgs.jp2a
    pkgs.timer # CLI sleep progress app
    pkgs.light # GNU/Linux application to control backlights
    pkgs.xclip
    pkgs.chafa # Transform images into colorful ascii (works with gifs too)
    pkgs.unzip # Unzip files using the terminal
    pkgs.lolcat
    pkgs.speechd
    pkgs.libnotify
    pkgs.zig
    # img2pdf # Convert images to pdf
    pkgs.lazygit # Amazing CLI git tool
    pkgs.ripgrep
    pkgs.findutils
    # flameshot
    pkgs.traceroute
    pkgs.tree-sitter # A parser generator tool and an incremental parsing library
    pkgs.appimage-run # Run appimage files in the terminal
    pkgs.polkit_gnome
    pkgs.networkmanager
    pkgs.temporal-cli
    pkgs.awscli2

    # Terminal && prompt
    pkgs.nerdfix # Helps you find/fix obsolete Nerd font icons

    # Text Editors
    # emacs
    pkgs.neovide # Gui neovim editor with cool animations

    # Browser, vc, pdf
    pkgs.discord
    pkgs.zathura # PDF viewer
    pkgs.firefox-wayland
    pkgs.wpsoffice # MS office alternative for linux
    pkgs.google-chrome
    pkgs.joplin-desktop # Note taking
    # davinci-resolve # Video editor
    # notion-app-enhanced

    # Anime/Manga
    pkgs.ani-cli # A cli tool to browse and play anime
    pkgs.mangal # A fancy CLI app written in Go which scrapes, downloads and packs manga into different formats

    # Rice
    pkgs.lf # CLI file manager written in GO
    pkgs.swww # Cool wallpapers/gifs transitions
    # sxhkd # BSPWM keybindings
    pkgs.bemenu # Dmenu for wayland
    pkgs.cmatrix
    pkgs.cbonsai
    # polybar # Bar i use on X11
    pkgs.nitrogen # Wallpaper utility for X11
    # picom-next # Compositor for X11
    # eww-wayland # Cool widgets for wayland
    pkgs.lxappearance # Gui software to change icons/themes
    # brightnessctl
    pkgs.cinnamon.nemo # Cinnamon File manager

    # Streaming/screenshot
    pkgs.grim # Screenshot tool for hyprland
    pkgs.slurp # Works with grim to screenshot on wayland
    pkgs.ffmpeg_5 # A complete, cross-platform solution to record, convert and stream audio and video
    pkgs.obs-studio # Livestreams
    # hyprpicker # Color picker for hyprland
    pkgs.wl-clipboard # Enables copy/paste on wayland

    # Gaming
    # gnutls
    # minecraft
    # libpulseaudio

    # Others
    # spotify
    # obsidian
    pkgs.pavucontrol
    pkgs.pamixer
  ];
}
