{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # packages that don't need configuration
    gargoyle
    lunarvim
    btop
    google-chrome
    kdePackages.dolphin
    vscode
    eza
    thefuck
    glfw
    discord

    # files
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    ffmpegthumbnailer

    # safety
    mullvad-vpn
    bitwarden
    keepassxc
    file-roller
    
    # dev
    gcc
    python3
    lua
    lazygit
    lazydocker
    docker

    # cli
    distrobox
    yt-dlp
    gallery-dl
    ffmpeg-full
    ripgrep
    jq
    yq-go
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    zip
    xz
    unzip
    p7zip
    glow

    # system info
    btop
    fastfetch
    nitch
    gdu
    gparted
  ];
}
