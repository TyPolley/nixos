{ config, pkgs, lib , ... }:

{
  imports = [
    #system config
    ../hardware-configuration.nix
    ../modules/boot.nix
    ../modules/nix.nix
    ../modules/networking.nix
    ../modules/locale.nix
    ../modules/desktop.nix
    ../modules/audio.nix
    ../modules/printing.nix
    ../modules/virtualization.nix

    #Users
    ../modules/users.nix
    ../modules/packages.nix
    ../modules/services.nix
    ../modules/state.nix
    ../modules/steam.nix
    ../modules/language.nix



  ];
 
  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/69847de7-be1b-42e4-b161-e5f8f91068af";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/games/swapfile"; }
  ];


  



}
