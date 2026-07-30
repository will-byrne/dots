{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.idea
    jetbrains.rust-rover
    jetbrains.webstorm
    neovide
    zed-editor-fhs
    vscode
    claude-code
    llmfit
  ];
}
