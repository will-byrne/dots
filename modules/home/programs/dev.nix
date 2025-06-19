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
    #bun
    #nodejs_22
    #rustup

    # openjdk
    # jdk17
    # libglvnd
    # libGLU
    # glfw
    # maven
  ];

  # add custom desktop entry for running LunarVim inside Neovide
  xdg.desktopEntries.neoluna = {
    name = "NeoLuna";
    genericName = "Text Editor";
    comment = "Launch LunarVim in Neovide";
    exec = "neovide -- -u ${pkgs.lunarvim}/share/lvim/init.lua";
    icon = "lvim";  # Or a custom icon path like "${./icons/lunarvim.svg}"
    terminal = false;
    categories = [ "Utility" "TextEditor" ];
  };
}
