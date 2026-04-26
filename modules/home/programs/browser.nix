{ config, pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      policies = {
        DownloadDirectory = "\${home}/downloads";
        OfferToSaveLogins = false;
        PromptForDownloadLocation = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "never";
      };
      profiles.default.extensions.force = true;
    };
  };

  home.packages = with pkgs; [
    google-chrome
    chromium
  ];
}
