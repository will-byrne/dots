{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDES
    jetbrains.idea-oss
    jetbrains.rust-rover
    jetbrains.webstorm
    lunarvim
    neovide
    # zed-editor-fhs
    vscode
    postman
  ];

  # add custom desktop entry for running LunarVim inside Neovide
  xdg.desktopEntries.neoluna = {
    name = "NeoLuna";
    genericName = "Text Editor";
    comment = "Launch LunarVim in Neovide";
    exec = "neovide -- -u ${pkgs.lunarvim}/share/lvim/init.lua";
    icon = "lvim";
    terminal = false;
    categories = [ "Utility" "TextEditor" ];
  };
}
