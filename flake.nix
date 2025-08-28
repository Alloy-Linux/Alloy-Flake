{
  description = "The Alloy Linux flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-software-center.url = "github:Alloy-Linux/nix-software-center";
  };

  outputs = { self, nixpkgs, nix-software-center, ... }@inputs: {
    nixosModules = {
      branding = ./modules/branding.nix;
      default = [
        ./modules/branding.nix
      ];
    };
  };
}