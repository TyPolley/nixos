{ self, inputs, ... }:

{
  flake.nixosModules.sysNetworking = { config, pkgs, ... }: {
    networking.networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    # networking.wireless.enable = true;  # via wpa_supplicant if needed
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networking.firewall.enable = true;
  };
}