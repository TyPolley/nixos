{ self, inputs, ... }:

{
  flake.nixosModules.sysWireguardClient = { config, pkgs, lib, ... }:

  with lib;
  let
    cfg = config.modules.wireguardClient;
  in
  {
    options.modules.wireguardClient = {
      enable = mkEnableOption "WireGuard client for Clients";
    };

    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        wireguard-tools
      ];

      networking.wg-quick.interfaces.wg0 = {
        address = [ "10.100.0.2/24" ]; #as more machines are added to ssh, expand this

        privateKeyFile = "/etc/wireguard/private";

        dns = [ "1.1.1.1" ];

        peers = [
          {
            # Kosm server public key
            publicKey = "6JDSDzQ8sBfDBNu2gwStKWfiy/uxSTWzZWnLq2HrUmE=";

            endpoint = "gruntpunt.tplinkdns.com:51820";

            allowedIPs = [ "10.100.0.0/24" ];

            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}