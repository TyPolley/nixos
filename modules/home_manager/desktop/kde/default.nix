
{ self, ... }:

{
  flake.homeModules.hmKDE = { inputs, pkgs, ... }: {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];

  
    xdg.dataFile = {
      # Color scheme
      "color-schemes/Tachyon.colors".source =
        ./assets/colors/Tachyon.colors;

      # Cursor theme folder
      "icons/Skyrim".source =
        ./assets/cursors/Skyrim;

      # Icon theme folder
      "icons/TachyonIcons".source =
        ./assets/icons/TachyonIcons;

      # Sound theme folder
      "sounds/TachyonSounds" = {
        source = ./assets/sounds/TachyonSounds;
      };
    };

    programs.plasma = {
      enable = true;

      # Start with empty session
      configFile."ksmserverrc"."General"."loginMode" = "emptySession";

      workspace = {
        wallpaper = ../../../../assets/background.jpg;

        colorScheme = "Tachyon";

        iconTheme = "TachyonIcons";

        cursor = {
          theme = "Skyrim";
          size = 32;
        };
      };

      configFile = {
        # Force color scheme
        "kdeglobals"."General"."ColorScheme" = "Tachyon";

        # Force icon theme
        "kdeglobals"."Icons"."Theme" = "TachyonIcons";

        # Force cursor theme
        "kcminputrc"."Mouse"."cursorTheme" = "Skyrim";
        "kcminputrc"."Mouse"."cursorSize" = 32;

        # Force sound theme
        "kdeglobals"."Sounds"."Theme" = "TachyonSounds";
      };
    };
  };
}