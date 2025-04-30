{
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
    stateVersion = "24.11";
  };

  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };

  services.udiskie.enable = true;

  programs.home-manager.enable = true;
}
