{ self, ... }:

{
  flake.homeModules.hmKvantum = { pkgs, ... }: {
    home.packages = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
      kdePackages.qt6ct
    ];

    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "kvantum";
    };

    xdg.configFile = {

      "Kvantum/Tachyon".source = ./themes/Tachyon;

      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Tachyon
      '';
    };

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "kvantum";
    };
  };
}