{ self, inputs, ... }: {

    flake.nixosModules.sysVirtualization = { config, pkgs, ... }:

    {
        virtualisation.libvirtd.enable = true;
    };

}