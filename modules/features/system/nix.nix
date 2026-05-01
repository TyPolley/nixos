{ self, inputs, ... }: {

    flake.nixosModules.sysNix = { config, pkgs, ... }:
    {
        # Custom nixPath
        #nix.nixPath = [ "/home/yharnam/NixOS/Config/configuration.nix" ];
        nix.nixPath = [
        "nixpkgs=${pkgs.path}"
        "nixos-config=/home/yharnam/.config/nixos-order/modules/configuration.nix"
        ];


        # Experimental features
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };

}