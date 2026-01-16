{ config, pkgs, ... }:
{
  # Show package differences during activation using nvd
  system.activationScripts.preActivation = ''
    if [[ -e /run/current-system ]]; then
      echo "--- diff to current-system"
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${config.nix.package}/bin diff /run/current-system "$systemConfig"
      echo "---"
    fi
  '';

  services.timesyncd.enable = false;

  # Enable services here if/when needed:
  # services.openssh.enable = true;

  # Firewall examples:
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;  # not recommended
}
