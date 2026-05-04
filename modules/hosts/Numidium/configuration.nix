{ self, inputs, ...}: {
    flake.nixosModules.NumidiumConfiguration = { pkgs, lib, ... }: 

    {
        imports = with self.nixosModules;
            [ 
                #System Basics
                NumidiumHardware
                sysAudio
                sysBoot
                sysLocale
                sysNetworking
                sysNix
                sysServices
                sysUsers

                #System optionals
                sysDesktop
                sysLanguage
                sysBasePackages
                sysDesktopPackages
                sysPrinting           
                sysSteam
                sysNumidiumSteam         
                sysVirtualization
                sysSDDM

            ];

        networking.hostName = "Numidium";

        system.stateVersion = "25.11";

        fileSystems."/games" = {
            device = "/dev/disk/by-uuid/69847de7-be1b-42e4-b161-e5f8f91068af";
            fsType = "ext4";
        };

        swapDevices = [
            { device = "/games/swapfile"; }
        ];

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit self inputs; };

        home-manager.users.yharnam = self.homeModules.NumidiumHome;

    };
}