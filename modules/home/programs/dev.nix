{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.webstorm
    jetbrains.rust-rover
    neovide
    zed-editor-fhs
    vscode

    # Languages
    bun
    nodejs_23
  ];
}
