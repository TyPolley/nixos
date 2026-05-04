{ self, inputs, ... }: {
  flake.nixosConfigurations.Numidium = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    
    specialArgs = { inherit self inputs; };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.NumidiumConfiguration
    ];
  };
}