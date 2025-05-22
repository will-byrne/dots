{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.idea-community
    jetbrains.rust-rover
    jetbrains.webstorm
    lunarvim
    neovide
    deno
    zed-editor-fhs
    vscode

    # Languages
    bun
    nodejs_22
    rustup
    maven
    # openjdk
    jdk17
    libglvnd
    libGLU
    glfw
  ];
}
