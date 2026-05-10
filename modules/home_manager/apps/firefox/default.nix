{ self, ... }:

{
  flake.homeModules.hmFirefox = { inputs, pkgs, ... }: {
    programs.firefox = {
      enable = true;

      configPath = ".mozilla/firefox";

      profiles.default = {
        id = 0;
        name = "default";
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "sidebar.verticalTabs" = true;
          "ultima.tabs.tabbar.autohide" = true;
          "ultima.tabs.closetabbutton.on.icon" = true;
          "ultima.tabs.tabCounter" = false;
          "ultima.tabs.hide.splitter" = true;
          "ultima.tabs.tabgroups.background.2" = false;
          "ultima.tabs.tabgroups.background.3" = true;
          "ultima.urlbar.drags.window" = true;
          "ultima.urlbar.hide.buttons" = true;

        };
      };
    };

    # FF-ULTIMA wants the full repo contents inside profile/chrome
    home.file.".mozilla/firefox/default/chrome".source = inputs.ff-ultima;

    # FF-ULTIMA first-time setup prefs
    home.file.".mozilla/firefox/default/user.js".source =
      "${inputs.ff-ultima}/user.js";
  };
}