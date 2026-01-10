#May or may not be used at a later date.

{
  description = "My NixOS config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hardware-configuration.nix

          home-manager.nixosModules.home-manager
          ./configuration.nix  

          {

          #home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.yharnam = {
                imports = [
                  #plasma-manager.homeModules.plasma-manager
                  #./home

                  #User Stuff
                  ./users/yharnam
                ];

              home.stateVersion = "23.11";
              };

          }

        ];
      };
    };
}
