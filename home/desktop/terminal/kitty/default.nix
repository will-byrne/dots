{pkgs, ...}: {
  home.packages = with pkgs; [kitty];
  xdg.configFile."kitty/kitty.conf".text = import ./kitty.nix;
  xdg.configFile."kitty/themes/lunar.conf".text = import ./lunar.nix;
  xdg.configFile."kitty/themes/macchiato.conf".text = import ./macchiato.nix;
}
