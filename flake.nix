#May or may not be used at a later date.

{
  description = "My NixOS config";

  inputs = {

    #Using Nix Unstable
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    #Home manager!!!
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # KDE Plasma Specific
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Not heavily used as of now
    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix/24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, quickshell, kwin-effects-forceblur , spicetify-nix , nix-index-database , ...}:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      #vesktopOverlay = final: prev: {
      #  vesktop = nixpkgs.legacyPackages.${system}.vesktop;
      #};

    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hardware-configuration.nix

          home-manager.nixosModules.home-manager
          ./config/configuration.nix  

          {

          home-manager.extraSpecialArgs = { inherit quickshell; };
          home-manager.users.yharnam = {
                imports = [
                  #plasma-manager.homeModules.plasma-manager
                  #./home

                  #User Stuff
                  ./users/yharnam

                  #quickshell
                  ./home/quickshell

                  #Vesktop
                  ./home/vesktop

                  #Spotify
                  ./home/spotify

                  #Proton Plus
                  ./home/protonPlus

                  nix-index-database.homeModules.default
                ];

              home.stateVersion = "24.11";
              };   
          }


          ({ config, pkgs, ... }: {
            environment.systemPackages = [
              # better blur for Wayland
              kwin-effects-forceblur.packages.${system}.default
              # better blur for X11
              kwin-effects-forceblur.packages.${system}.x11
            ];
          })

        ];
      };
    };
}
