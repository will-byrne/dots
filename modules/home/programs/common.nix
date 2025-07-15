{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # packages that don't need configuration
    discord
    signal-desktop
    immersed

    # files
    xfce.thunar-volman
    xfce.tumbler
    ffmpegthumbnailer
    file-roller

    # dev
    gcc
    python3
    lua
    lazygit
    lazydocker
    docker

    # cli
    unimatrix
    cbonsai
    eza
    pay-respects
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
    baobab
    fastfetch
    nitch
    gdu
    gparted
    nix-index
    powerstat
    powertop
  ];
}
