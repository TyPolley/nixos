{ self, inputs, ... }: {
    flake.nixosModules.sysWake = { ... }:

    {
        systemd.targets.sleep.enable = false;
        systemd.targets.suspend.enable = false;
        systemd.targets.hibernate.enable = false;
        systemd.targets.hybrid-sleep.enable = false;

        services.power-profiles-daemon.enable = false;
    };
}