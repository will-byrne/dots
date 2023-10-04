{pkgs, nixpkgs-unstable, ...}: {
  home.packages = with pkgs; [
    # NPM packages
    pkgs.nodejs
    pkgs.node2nix
    pkgs.yarn
    nixpkgs-unstable.bun
    pkgs.typescript
    pkgs.tailwindcss
    pkgs.nodePackages.npm # Package manager
    pkgs.nodePackages_latest.eslint_d # JS linter
    pkgs.nodePackages_latest.prettier # Formatter
    # nodePackages_latest.tailwindcss
    # nodePackages_latest.live-server # Live server
    pkgs.nodePackages_latest.typescript-language-server # lsp
  ];
}
