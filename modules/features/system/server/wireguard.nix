{ self, inputs, ... }:

{
  flake.nixosModules.sysWireguard = { config, pkgs, lib, ... }:

  with lib;
  let
    cfg = config.modules.wireguard;
  in
  {
    options.modules.wireguard = {
      enable = mkEnableOption "WireGuard VPN";
    };

    config = mkIf cfg.enable {
      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.100.0.1/24" ];

          listenPort = 51820;

          privateKeyFile = "/etc/wireguard/private";

          peers = [
            # Gaming Desktop
            {
              publicKey = "csKYCZs3rOW0dGNkDU+y7H3bZF9t+k9wWr1uEpQAPQM=";
              allowedIPs = [ "10.100.0.2/32" ];
            }
          ];
        };
      };

      networking.firewall.allowedUDPPorts = [ 51820 ];
    };
  };
}