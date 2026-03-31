{ inputs, pkgs, config, ... }:
{
  programs.vesktop = {
    enable = true;

    # Vesktop app settings (hardware acceleration for GPU usage, discord branch)
    settings = {
      hardwareAcceleration = true;
      discordBranch = "stable";
    };

    # Vencord settings
    vencord.settings = {

      enabledThemes = ["NotAnotherAnimeTheme.css"];

      plugins = {
        # Force animations to play on everything that uses animations.
        AlwaysAnimate = {
          enabled = true;
        };

        # Always expands role list in profile popouts.
        AlwaysExpandRoles = {
          enabled = true;
        };

        # Folder management for servers in the sidebar
        BetterFolders = {
          enabled = false;
          sidebar = true;
          sidebarAnim = true;

          closeAllFolders = false;
          closeAllHomeButton = false;
          closeOthers = false;
          forceOpen = true;
        };

        BetterGifAltText = { enabled = true; };

        BetterSessions = {
          enabled = true;
          backgroundCheck = true;
          checkInterval = 15;
        };

        BetterSettings = { enabled = true; };

        CallTimer = {
          enabled = true;
          format = "stopwatch";
        };

        ClearURLs = { enabled = true; };

        ConsoleJanitor = {
          enabled = true;
          disableLoggers = true;
          disableSpotifyLogger = true;

          whitelistedLoggers = ''
            GatewaySocket;
            Routing/Utils
          '';
        };

        DisableCallIdle = { enabled = true; };

        DontRoundMyTimestamps = { enabled = false; };

        ExpressionCloner = { enabled = true; };

        FixImagesQuality = { enabled = true; };

        ForceOwnerCrown = { enabled = true; };

        FriendsSince = { enabled = true; };

        MemberCount = {
          enabled = true;
          toolTip = true;
          memberList = true;
        };

        MentionAvatars = { enabled = true; };

        MessageLogger = {
          enabled = true;
          logDeletes = true;
          logEdits = true;
          inlineEdits = true;
          ignoreBots = true;
        };

        NoPendingCount = {
          enabled = true;
          hideFriendRequestsCount = false;
          hideMessageRequestCount = false;
          hidePremiumOffersCount = true;
        };

        NormalizeMessageLinks = { enabled = true; };

        PermissionsViewer = { enabled = true; };

        PreviewMessage = { enabled = true; };

        RelationshipNotifier = {
          enabled = true;
          notices = true;
        };

        ReplyTimestamp = { enabled = true; };

        ReverseImageSearch = { enabled = true; };

        ServerInfo = { enabled = true; };

        ShowHiddenChannels = { enabled = true; };

        ShowMeYourName = {
          enabled = true;
          mode = "user-nick";
        };

        SilentMessageToggle = {
          enabled = true;
          autoDisable = false;
        };

        SilentTyping = {
          enabled = true;
          showIcon = true;
          contextMenu = true;
          isEnabled = true;
        };

        TypingIndicator = {
          enabled = true;
          includeMutedChannels = true;
          includeBlockedUsers = true;
          indicatorMode = "both";
        };

        TypingTweaks = {
          enabled = true;
          showAvatars = true;
          showRoleColors = false;
          alternativeFormatting = true;
        };

        UserVoiceShow = {
          enabled = true;
          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };

        ValidReply = { enabled = true; };

        ValidUser = { enabled = true; };

        ViewIcons = {
          enabled = true;
          format = "png";
        };
      };
    };
        vencord.themes = {
        "NotAnotherAnimeTheme.css" = ''
          @import url("https://puckzxz.github.io/NotAnotherAnimeTheme/build/v3/naat.v3.css");

          :root {
            --theme-background-image: url("ttps://i.imgur.com/g8wXX43.jpeg");
            /* --transparency: 0.15; */
          }
        '';
      };
  };
}
