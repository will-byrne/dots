{
  description = "Luna's NixOS config for desktop and laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    comfyui-nix.url = "github:utensils/comfyui-nix";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, catppuccin, nixos-hardware, comfyui-nix, noctalia, noctalia-qs, home-manager, ... }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostname = "desktop"; };
          modules = [
            ./hosts/desktop
            ./modules
            { nixpkgs.hostPlatform = "x86_64-linux"; }
            comfyui-nix.nixosModules.default
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.luna.imports = [
                  ./modules/home
                  catppuccin.homeModules.catppuccin
                  noctalia.homeModules.default
                ];
                extraSpecialArgs = { inherit inputs; hostname = "desktop"; };
              };
            }
          ];
        };
        p14 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostname = "p14"; };
          modules = [
            ./hosts/p14
            ./modules
            { nixpkgs.hostPlatform = "x86_64-linux"; }
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
                  noctalia.homeModules.default
                ];
                extraSpecialArgs = { inherit inputs; hostname = "p14"; };
              };
            }
          ];
        };
      };
  };
}
