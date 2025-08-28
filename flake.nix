{
  description = "The Alloy Linux flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, ... }@inputs: {
    nixosModules = {
      branding = ./modules/branding.nix;
      default = [
        ./modules/branding.nix
        lanzaboote.nixosModules.lanzaboote
        ./modules/secureboot.nix
      ];
    };
  };
}