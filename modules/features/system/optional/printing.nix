{ self, inputs, ... }: {
    flake.nixosModules.sysPrinting = { config, pkgs, ... }:

    {

        services.printing.enable = true; # CUPS
        
    };
}