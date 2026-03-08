{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.idea-oss
    jetbrains.rust-rover
    jetbrains.webstorm
    neovide
    zed-editor-fhs
    vscode
    postman
  ];
}
