{ pkgs, ... }:

let
  background = ../assets/background.png;
  midGif = ../assets/mid.gif;

  # # Gold color palette
  primary = "#C2A46F";
  secondary = "#9A845A";
  tertiary = "#685841";
  bg = "#1A1216";
  surface = "#2A2220";
  elevated = "#33151f";
  accent = "#4d1927";
  warning = "#fc2e64";

  #catpuccin mocha
  # primary = "#463F60";
  # secondary = "#3A3452";
  # tertiary = "#2E2A44";
  # bg = "#0F0D18";
  # surface = "#171424";
  # elevated = "#211C30";
  # accent = "#5A4B7A";
  # warning = "#7A1F3D";

  yharnamSDDM =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "post-apocalyptic_hacker";
      themeConfig = {
        # general ---------------------------------------
        ScreenWidth = "3072";
        ScreenHeight = "1920";
        RoundCorners = "10";

        # keyboard --------------------------------------
        VirtualKeyboardPosition = "left";
        HideVirtualKeyboard = "false";
        HideSystemButtons = "false";
        HideLoginButton = "true";

        # background ------------------------------------
        Background = "${background}";

        # form ------------------------------------------
        FormPosition = "left";
        PartialBlur = "true";

        # font ------------------------------------------
        Font = "Cormorant Garamond";
        FontSize = "17";

        # colors ----------------------------------------

        # LoginFieldTextColor = "#2A2740";
        # DropdownBackgroundColor = "#1C182B";

        HeaderTextColor = primary;
        DateTextColor = secondary;
        TimeTextColor = primary;

        FormBackgroundColor = bg;
        BackgroundColor = bg;
        DimBackgroundColor = bg;

        LoginFieldBackgroundColor = elevated;
        PasswordFieldBackgroundColor = elevated;

        # LoginFieldTextColor = "#765D5B";
        PasswordFieldTextColor = primary;

        UserIconColor = tertiary;
        PasswordIconColor = tertiary;

        PlaceholderTextColor = tertiary;
        WarningColor = warning;

        LoginButtonTextColor = primary;
        LoginButtonBackgroundColor = tertiary;

        SystemButtonsIconsColor = tertiary;
        SessionButtonTextColor = tertiary;
        VirtualKeyboardButtonTextColor = tertiary;

        DropdownTextColor = primary;
        DropdownSelectedBackgroundColor = accent;
        # DropdownBackgroundColor = "#32141f";

        HighlightTextColor = primary;
        HighlightBackgroundColor = accent;
        HighlightBorderColor = accent;

        HoverUserIconColor = warning;
        HoverPasswordIconColor = warning;
        HoverSystemButtonsIconsColor = warning;
        HoverSessionButtonTextColor = warning;
        HoverVirtualKeyboardButtonTextColor = warning;
      };
    })/*.overrideAttrs (old: {
      installPhase = (old.installPhase or "") + ''
        themeDir="$out/share/sddm/themes/sddm-astronaut-theme"
        
        ----- THIS DONT WORK -----
        install -Dm644 ${midGif} "$themeDir/Assets/mid.gif"

        ----- THIS WORKED ONCE ----- (lol, may get this working at a later date)
        substituteInPlace "$themeDir/Components/LoginForm.qml" \
          --replace-fail $'    Input {\n' $'    Image {\n        id: midImage\n\n        source: "../Assets/mid.gif"\n        fillMode: Image.PreserveAspectFit\n        smooth: true\n        mipmap: true\n\n        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter\n        Layout.preferredHeight: root.height / 8\n        Layout.maximumHeight: root.height / 8\n        Layout.preferredWidth: root.width / 5\n        Layout.topMargin: 6\n        Layout.bottomMargin: 6\n    }\n\n    Input {\n'
      '';
    })*/;

  cormorant = pkgs.google-fonts.override {
    fonts = [ "Cormorant Garamond" ];
  };

in
{
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";

    wayland = {
      enable = true;
      compositor = "kwin";
    };

    enableHidpi = true;
    autoNumlock = true;

    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      kdePackages.qtmultimedia
      cormorant
    ];

    settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
      };

      Theme = {
        CursorTheme = "";
        CursorSize = 28;
      };
    };
  };

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <dir>/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Fonts</dir>
    </fontconfig>
  '';

  fonts.packages = [
    cormorant
  ];

  environment.systemPackages = [
    yharnamSDDM
  ];
}
