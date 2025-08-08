{
  description = "The Alloy Linux flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-software-center.url = "github:Alloy-Linux/nix-software-center";
  };

  outputs = { self, nixpkgs, nix-software-center, ... }@inputs: {
    nixosConfigurations.alloy-linux = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/branding.nix
      ];
      specialArgs = {
        version = "0.1/25.05";
      };
    };

    packages.x86_64-linux = {
      nix-software-center = nix-software-center.packages.x86_64-linux.default;
      default = nix-software-center.packages.x86_64-linux.default;
    };
  };
}