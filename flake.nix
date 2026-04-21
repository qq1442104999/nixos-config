{
  description = "NixOS + Home Manager Flake for user wang";

  # 1️⃣ 输入
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    disko =  {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url =  "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-flatpak = {
      # url = "github:gvolpe/nix-flatpak";
      # inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # 2️⃣ 输出
  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = {

          wang = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/wang/configuration.nix ];
          };

          laptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/laptop/configuration.nix ];
          };
        };
      };
    };
}
