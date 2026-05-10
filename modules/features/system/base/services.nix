{ self, inputs, ... }: {

    flake.nixosModules.sysServices = { config, pkgs, ... }:
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
        
    };
}