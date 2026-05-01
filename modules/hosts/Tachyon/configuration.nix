{ self, inputs, ...}: {
    flake.nixosModules.TachyonConfiguration = { pkgs, lib, ... }: 

    {
        imports = with self.nixosModules;
            [ 
                #Essentials
                TachyonHardware
                sysAudio
                sysBoot
                sysDesktop
                sysLanguage
                sysNetworking
                sysNix
                sysLocale
                sysPackages
                sysPrinting
                sysServices
                sysState
                sysSteam
                sysUsers
                sysVirtualization
                sysSDDM

            ];

        networking.hostName = "Tachyon";

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit self inputs; };

        home-manager.users.yharnam = self.homeModules.TachyonHome;

    };
}