{ self, inputs, ... }: {
  flake.nixosConfigurations.Kosm = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    
    specialArgs = { inherit self inputs; };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.KosmConfiguration
    ];
  };
}