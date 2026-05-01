{ self, inputs, ... }: {
    flake.nixosModules.sysState = { config, pkgs, ... }:
    {
        system.stateVersion = "25.11"; # Keep as the version from your first install
    };
}