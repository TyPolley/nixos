{ self, inputs, ... }: {

    flake.nixosModules.sysNix = { config, pkgs, ... }:
    {
        # Custom nixPath
        # nix.nixPath = [
        # "nixpkgs=${pkgs.path}"
        # "nixos-config=${config.system.build.toplevel}/etc/nixos/configuration.nix"
        # ];

        
        nixpkgs.config.allowUnfree = true;

        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };

}

# OR

# { config, pkgs, ... }:

# let
#   user = "username";
# in {
#   nix.nixPath = [
#     "nixpkgs=${pkgs.path}"
#     "nixos-config=${config.users.users.${user}.home}/.config/nixos-order/modules/configuration.nix"
#   ];
# }