{ self, inputs, ... }:

{
  flake.nixosModules.sysNumidiumSteam = { config, pkgs, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        vulkan-loader
        # vulkan-validation-layers
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        vulkan-loader
      ];
    };
  };
}