{
  inputs,
  config,
  nix-colors,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "luna";
    homeDirectory = "/home/luna";
    stateVersion = "22.11";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  # Imports
  imports = [
    ./dev
    ./pkgs
    ./system
    ./themes
    ./services
    ./terminal
    ./graphical
  ];

  # Overlays
  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
          };
        }
      );
    })
    # (import (builtins.fetchTarball {
    #   url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    # }))
    (import ../../overlays/firefox-overlay.nix)
    (import ../../overlays/ryan-mono-bin.nix)
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    # integrates nur within Home-Manager
    nur =
      import
      (builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
        sha256 = "sha256:1v9vblnm0yq5gq6ydca0a23fd196vk023mymsydyb858i4m8vn5h";
      })
      {inherit pkgs;};
  };

  nixpkgs.config.allowUnfreePredicate = pkg: true;

  fonts.fontconfig.enable = true;

  # Add support for .local/bin
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
