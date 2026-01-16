{ config, pkgs, ... }:

{
  users.users.yharnam = {
    isNormalUser = true;
    description = "Ty Polley";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      pkgs.kdePackages.kate
      # thunderbird
      r2modman
      shotcut
      obs-studio
      vivaldi
    ];
  };

  programs = {

    firefox.enable = true;

  };
}
