{ catppuccin, ... }:{
  imports = [
    ./desktop
    ./programs
    ./shell
  ];

  home = {
    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      SHELL = "zsh";
    };
    stateVersion = "25.05";
  };

  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };

  services.udiskie.enable = true;
  programs.home-manager.enable = true;
  
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    waybar.enable = false;
    vscode.enable = true;
    btop.enable = true;
    fuzzel.enable = true;
  };
}
