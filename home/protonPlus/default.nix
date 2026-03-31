{ pkgs, ... }:
{

home.packages = with pkgs; [
  steamtinkerlaunch
  xxd
  yad
  unzip
  wget
  xdotool
  xorg.xdpyinfo
  xorg.xwininfo
];

}