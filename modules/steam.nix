{ config, pkgs, ... }:

{
  ############################
  # Allow unfree (NVIDIA, Steam)
  ############################
  nixpkgs.config.allowUnfree = true;

  ############################
  # Boot / Kernel
  ############################
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];

  ############################
  # X11 + NVIDIA (AMD CPU compatible)
  ############################
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  ############################
  # NVIDIA driver
  ############################
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false; # proprietary driver
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  ############################
  # Graphics stack (MODERN)
  ############################
  hardware.graphics = {
    enable = true;

    # REQUIRED for Steam / Proton
    enable32Bit = true;

    # Vulkan loaders
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
    ];
  };

  ############################
  # Steam (native NixOS)
  ############################
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
  };

  ############################
  # Environment
  ############################
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "$HOME/.steam/root/compatibilitytools.d";
  };

  ############################
  # NOTES
  ############################
  # - Use Plasma (X11), NOT Wayland
  # - Do NOT set NIXOS_OZONE_WL for NVIDIA + OW2
}
