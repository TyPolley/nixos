{ config, pkgs, ... }:

{
  # X11
  services.xserver.enable = true;

  # KDE Plasma 6 + SDDM (Eventually change off SDDM)
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Touchpad defaults; enable if you need libinput:
  # services.xserver.libinput.enable = true;
}
