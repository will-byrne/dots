{ pkgs, config, ... }:
{
  programs.neovim = {
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      astroui
      astrocore
      astrolsp
      astrotheme
    ];
  };
  home.file = {
    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/modules/home/programs/neovim/nvim";
  };
  # ls, fmt, linters
  home.packages = with pkgs; [
    nodejs_25
    neovim
    gcc
    gnumake
    unzip
    tree-sitter
    bottom
    gdu
    fd
    ripgrep
    lazygit
    gopls
    clang-tools
    typescript-language-server
    pyright
    nixd
    deadnix
    nixfmt
    lua-language-server
    stylua
    markdownlint-cli
  ];
}
