{ self, inputs, ... }:

{
  flake.nixosModules.sysTachyonSteam = { config, pkgs, ... }: {
    boot.initrd.kernelModules = [ "nvidia" ];
    boot.blacklistedKernelModules = [ "nouveau" ];

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # prime = {
      #   offload.enable = true;
      #   offload.enableOffloadCmd = true;
      #   intelBusId = "PCI:0:2:0";
      #   nvidiaBusId = "PCI:1:0:0";
      # };
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}