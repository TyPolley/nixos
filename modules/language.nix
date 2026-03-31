{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-hangul
      qt6Packages.fcitx5-configtool
    ];
  };

  environment.systemPackages = with pkgs; [
    maliit-keyboard
  ];
  
}