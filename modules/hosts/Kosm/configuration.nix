{ self, inputs, ...}: {
    flake.nixosModules.KosmConfiguration = { pkgs, lib, ... }: 

    {
        imports = with self.nixosModules;
            [ 
                #System Basics
                KosmHardware
                sysAudio
                sysBoot
                sysLocale
                sysNetworking
                sysNix
                sysServices
                sysUsers
                sysSSH
                sysWireguard

                #System optionals
                sysBasePackages                    
                sysVirtualization
                sysCode
                sysWake
                

            ];

        networking.hostName = "Kosm";

        system.stateVersion = "25.11";

        networking.firewall.allowedTCPPorts = [ 22 25565 24454 ];

        modules.ssh.enable = true;
        modules.wireguard.enable = true;

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit self inputs; };

        home-manager.users.yharnam = self.homeModules.KosmHome;

    };
}