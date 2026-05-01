{ inputs, ... }:

{
  flake.homeModules.hmNoctalia = { pkgs, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;

      settings = {
        settingsVersion = 0;

        # bar = {
        #   enabled = true;
        #   barType = "simple";
        #   position = "top";

        #   # safer than hardcoding eDP-1
        #   monitors = [ ];

        #   density = "default";
        #   showOutline = false;
        #   showCapsule = false;

        #   backgroundOpacity = 0.90;

        #   marginVertical = 4;
        #   marginHorizontal = 4;
        #   frameThickness = 6;
        #   frameRadius = 10;

        #   displayMode = "always_visible";

        #   widgets = {
        #     left = [
        #       { id = "Launcher"; }
        #       { id = "ActiveWindow"; }
        #     ];

        #     center = [
        #       { id = "Workspace"; }
        #     ];

        #     right = [
        #       { id = "Tray"; }
        #       { id = "Volume"; }
        #       { id = "Battery"; }
        #       { id = "Clock"; }
        #     ];
        #   };
        # };

# ---------------------------------------------------------------

        bar = {
          barType = "framed";
          position = "left";
          monitors = [ ];
          density = "comfortable";
          showOutline = false;
          showCapsule = true;
          capsuleOpacity = 1;
          capsuleColorKey = "none";
          widgetSpacing = 9;
          contentPadding = 2;
          fontScale = 1.1;
          enableExclusionZoneInset = true;
          backgroundOpacity = 0.93;
          useSeparateOpacity = false;
          marginVertical = 4;
          marginHorizontal = 4;
          frameThickness = 8;
          frameRadius = 12;
          outerCorners = true;
          hideOnOverview = false;
          displayMode = "always_visible";
          autoHideDelay = 500;
          autoShowDelay = 150;
          showOnWorkspaceSwitch = true;

          widgets = {
            left = [
              { id = "Launcher"; }
              { id = "Clock"; }
              { id = "SystemMonitor"; }
              { id = "ActiveWindow"; }
              { id = "MediaMini"; }
            ];

            center = [
              { id = "Workspace"; }
            ];

            right = [
              { id = "Tray"; }
              { id = "NotificationHistory"; }
              { id = "Battery"; }
              { id = "Volume"; }
              { id = "Brightness"; }
              { id = "ControlCenter"; }
            ];
          };
          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [ ];
        };

# ---------------------------------------------------------------


        dock = {
          enabled = true;
          position = "top";
          displayMode = "auto_hide";
          dockType = "floating";

          # Use [] first so it works on KDE regardless of monitor name.
          # If needed, replace with your actual monitor later.
          monitors = [ ];

          backgroundOpacity = 1;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;

          pinnedApps = [ ];
          colorizeIcons = false;

          showLauncherIcon = false;
          launcherPosition = "end";
          launcherUseDistroLogo = false;
          launcherIcon = "";
          launcherIconColor = "none";

          pinnedStatic = false;
          inactiveIndicators = false;
          groupApps = false;
          groupContextMenuMode = "extended";
          groupClickAction = "cycle";
          groupIndicatorStyle = "dots";

          deadOpacity = 0.6;
          animationSpeed = 1;
          sitOnFrame = false;
          showDockIndicator = false;
          indicatorThickness = 3;
          indicatorColor = "primary";
          indicatorOpacity = 0.6;
        };

# ---------------------------------------------------------------

        appLauncher = {
          enableClipboardHistory = false;
          autoPasteClipboard = false;
          enableClipPreview = true;
          clipboardWrapText = true;
          enableClipboardSmartIcons = true;
          enableClipboardChips = true;
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          position = "top_center";
          pinnedApps = [ ];
          sortByMostUsed = true;
          terminalCommand = "alacritty -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "list";
          showCategories = true;
          iconMode = "tabler";
          showIconBackground = false;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          enableSessionSearch = true;
          ignoreMouseInput = false;
          screenshotAnnotationTool = "";
          overviewLayer = false;
          density = "default";
        };

# ---------------------------------------------------------------

        colorSchemes = {
          useWallpaperColors = false;
          predefinedScheme = "";
          darkMode = true;
          schedulingMode = "off";
          syncGsettings = false;
        };

        templates = {
          activeTemplates = [ ];
          enableUserTheming = true;
        };        

        wallpaper = {
          enable = false;
        };

        colors = {
          mError = "#ff6f9b";
          mOnError = "#000000";
          mOnPrimary = "#000000";
          mOnSecondary = "#000000";
          mOnSurface = "#e8d8ff";
          mOnSurfaceVariant = "#b58fff";
          mOnTertiary = "#000000";
          mOnHover = "#b58fff";
          mOutline = "#4c3a70";
          mPrimary = "#b58fff";
          mSecondary = "#c79aff";
          mShadow = "#000000";
          mSurface = "#000000";
          mHover = "#4c3a70";
          mSurfaceVariant = "#110d1a";
          mTertiary = "#d8b4ff";
        };

        ui = {
          panelsAttachedToBar = false;
          settingsPanelMode = "detached";
        };


        desktopWidgets.enabled = false;
        notifications.enabled = false;
        osd.enabled = false;

        location = {
          weatherEnabled = false;
          autoLocate = false;
        };

        idle.enabled = false;

        general = {
          lockOnSuspend = false;
          enableBlurBehind = false;
          showScreenCorners = false;
          showChangelogOnStartup = false;
          telemetryEnabled = false;
        };
      };
    };

# ---------------------------------------------------------------

    programs.plasma.hotkeys.commands = {

      noctalia-launcher = {
        name = "Toggle Noctalia Launcher";
        key = "Meta+Space";
        command = "noctalia-shell ipc call launcher toggle";
      };

      noctalia-session-menu = {
        name = "Toggle Noctalia Session Menu";
        key = "Meta+S";
        command = "noctalia-shell ipc call sessionMenu toggle";
      };

      noctalia-control-center = {
        name = "Toggle Noctalia Control Center";
        key = "Meta+C";
        command = "noctalia-shell ipc call controlCenter toggle";
      };

      noctalia-system-monitor = {
        name = "Toggle Noctalia System Monitor";
        key = "Meta+M";
        command = "noctalia-shell ipc call systemMonitor toggle";
      };

    };

# ---------------------------------------------------------------

    systemd.user.services.noctalia-shell = {
      Unit = {
        Description = "Noctalia Shell";
        After = [ 
          "graphical-session.target"
          "plasma-plasmashell.service" 
        ];
        PartOf = [ "graphical-session.target" ];
      };
      
      Service = {
        ExecStart = "${inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/noctalia-shell";
        Restart = "on-failure";
        RestartSec = 2;
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}

