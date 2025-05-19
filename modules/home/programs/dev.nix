{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.idea-community
    jetbrains.rust-rover
    jetbrains.webstorm
    lunarvim
    neovide
    zed-editor-fhs
    vscode

    # Languages
    bun
    nodejs_23
    rustup
    maven
    # openjdk
    jdk17
    libglvnd
    libGLU
  ];
}
