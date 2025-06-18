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
    nodejs_22
    rustup

    # openjdk
    # jdk17
    # libglvnd
    # libGLU
    # glfw
    # maven
  ];
}
