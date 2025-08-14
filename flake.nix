{
  description = "Luna's NixOS config for desktop and laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, catppuccin, nixos-hardware, home-manager, ... }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostname = "desktop"; };
          system = "x86_64-linux";
          modules = [
            ./hosts/desktop
            ./modules
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.luna.imports = [
                  ./modules/home
                  catppuccin.homeModules.catppuccin
                ];
                extraSpecialArgs = { inherit inputs; hostname = "desktop"; };
              };
            }
          ];
        };
        p14 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostname = "p14"; };
          system = "x86_64-linux";
          modules = [
            ./hosts/p14
            ./modules
            catppuccin.nixosModules.catppuccin
            nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen5
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.luna.imports = [
                  ./modules/home
                  catppuccin.homeModules.catppuccin
                ];
                extraSpecialArgs = { inherit inputs; hostname = "p14"; };
              };
            }
          ];
        };
      };
  };
}
