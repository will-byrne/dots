{ hostname, lib, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      # only explicitly override non-default values
      settingsVersion = 54;
      
      nightLight = {
        enabled = true;
        autoSchedule = true;
      };

      colorSchemes = {
        predefinedScheme = "Catppuccin";
      };

      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "kitty";
          }
          {
            enabled = true;
            id = "code";
          }
          {
            enabled = true;
            id = "zed";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "hyprland";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "fuzzel";
          }
          {
            enabled = true;
            id = "foot";
          }
          {
            enabled = true;
            id = "btop";
          }
          {
            enabled = true;
            id = "cava";
          }
          {
            enabled = true;
            id = "zathura";
          }
          {
            enabled = true;
            id = "yazi";
          }
        ];
        enableUserTheming = false;
      };
      
      bar = {
        monitors = lib.mkMerge [
          []
          (lib.mkIf (hostname== "desktop") ["DP-1"])
        ];
        
        widgets.left = [
          {
            colorizeSystemIcon = "tertiary";
            enableColorization = true;
            id = "Launcher";
          }
          {
            focusedColor = "primary";
            id = "Workspace";
            occupiedColor = "tertiary";
            
          }
          {
            colorName = "tertiary";
            hideWhenIdle = true;
            id = "AudioVisualizer";
          }
          {
            defaultSettings = {
              hideBackground = false;
              minimumThreshold = 10;
            };
            id = "plugin:catwalk";
          }
          {
            defaultSettings = {
              autoStartBreaks = false;
              autoStartWork = false;
              longBreakDuration = 15;
              sessionsBeforeLongBreak = 4;
              shortBreakDuration = 5;
              workDuration = 25;
            };
            id = "plugin:pomodoro";
          }
        ];

        widgets.center = [
          {
            colorizeIcons = false;
            hideMode = "hidden";
            id = "ActiveWindow";
            maxWidth = 145;
            scrollingMode = "hover";
            showIcon = true;
            textColor = "primary";
            useFixedWidth = false;
          }
          {
            clockColor = "primary";
            customFont = "";
            formatHorizontal = "HH:mm";
            formatVertical = "HH\nmm";
            id = "Clock";
            tooltipFormat = "HH:mm ddd, MMM dd";
            useCustomFont = false;
          }
        ];

        widgets.right = [
          {
            compactMode = false;
            hideMode = "hidden";
            hideWhenIdle = false;
            id = "MediaMini";
            maxWidth = 145;
            panelShowAlbumArt = true;
            scrollingMode = "hover";
            showAlbumArt = true;
            showArtistFirst = true;
            showProgressRing = true;
            showVisualizer = false;
            textColor = "secondary";
            useFixedWidth = false;
            visualizerType = "linear";
          }
          {
            displayMode = "alwaysShow";
            iconColor = "secondary";
            id = "Volume";
            middleClickCommand = "pwvucontrol || pavucontrol";
            textColor = "secondary";
          }
          {
            displayMode = "onhover";
            iconColor = "secondary";
            id = "Brightness";
          }
          {
            deviceNativePath = "__default__";
            displayMode = "graphic";
            hideIfIdle = false;
            hideIfNotDetected = true;
            id = "Battery";
            showNoctaliaPerformance = false;
            showPowerProfiles = true;
          }
          {
            id = "plugin:keybind-cheatsheet";
            modKeyVariable = "$mainMod";
          }
          {
            compactMode = true;
            diskPath = "/";
            iconColor = "secondary";
            id = "SystemMonitor";
            showCpuFreq = false;
            showCpuTemp = true;
            showCpuUsage = true;
            showDiskAvailable = false;
            showDiskUsage = true;
            showDiskUsageAsPercent = false;
            showGpuTemp = true;
            showLoadAverage = false;
            showMemoryAsPercent = false;
            showMemoryUsage = true;
            showNetworkStats = false;
            showSwapUsage = false;
            textColor = "none";
            useMonospaceFont = true;
            usePadding = false;
          }
          {
            displayMode = "alwaysShow";
            iconColor = "secondary";
            id = "Network";
            textColor = "secondary";
          }
          {
            blacklist = [];
            chevronColor = "none";
            colorizeIcons = false;
            drawerEnabled = false;
            hidePassive = true;
            id = "Tray";
            pinned = [];
          }
          {
            hideWhenZero = false;
            hideWhenZeroUnread = false;
            iconColor = "secondary";
            id = "NotificationHistory";
            showUnreadBadge = true;
            unreadBadgeColor = "primary";
          }
          {
            iconColor = "error";
            id = "SessionMenu";
          }
        ];
      };

      # general settings changed from defaults
      general = {
        avatarImage = "/home/luna/.face"; # default is empty
        dimmerOpacity = 0.2;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
      };
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
      };

      # location & weather configuration
      location = {
        name = "Burwell, UK";
        weatherEnabled = true;
        weatherShowEffects = true;
        showCalendarEvents = true;
        showCalendarWeather = true;
      };

      plugins = {
        autoUpdate = true;
        sources = [
          {
            enabled = true;
            name = "Official Noctalia Plugins";
            url = "https://github.com/noctalia-dev/noctalia-plugins";
          }
        ];
        states = {
          catwalk = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
          kaomoji-provider = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
          pomodoro = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
          keybind-cheatsheet = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
        };
        version = 2;
      };
      # wallpaper setup
      wallpaper = {
        enabled = true;
        directory = "/home/luna/pictures/wallpapers";
      };
    };
  };
}
