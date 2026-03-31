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
    ../modules/sddm.nix
    ../modules/audio.nix
    ../modules/printing.nix
    ../modules/virtualization.nix
    ../modules/users.nix
    ../modules/packages.nix
    ../modules/services.nix
    ../modules/state.nix
    ../modules/steam.nix


  ];

  programs.git = {
  enable = true;
  config = {
    user = {
      name = "Ty Polley";
      email = "polleyty21@gmail.com";
      };
    };
  };


#  fileSystems."/mnt/games" = {
#  device = "/dev/disk/by-label/GAMES";
#  fsType = "ext4";
#  };


  



}
