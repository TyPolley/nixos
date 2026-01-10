{ config, pkgs, ... }:

{
  #Using systemd instead of GRUB. Might change later
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
