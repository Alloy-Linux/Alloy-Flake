{
  description = "The Alloy Linux flake.";

  inputs = {
    nix-software-center.url = "github:Alloy-Linux/nix-software-center";
  };

  outputs = { self, nix-software-center }@inputs: {
    packages.x86_64-linux = {
      nix-software-center = nix-software-center.packages.x86_64-linux.default;
      default = self.packages.x86_64-linux.nix-software-center;
    };
  };
}