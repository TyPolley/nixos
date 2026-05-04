{ self, inputs, ... }: {

    flake.nixosModules.sysUsers = { config, pkgs, ... }:

    {
        users.users.yharnam = {
            isNormalUser = true;
            description = "Ty Polley";
            extraGroups = [ "networkmanager" "wheel" ];
        };
    };

}