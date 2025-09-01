{ pkgs, config, hostname, lib, ... }:
{
  home.file.".config/zsh/.p10k.zsh".source = ./p10k.zsh;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable  = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };

    plugins = [
      {
        name = "zsh-256color";
        src = pkgs.fetchFromGitHub {
          owner = "chrisiscool";
          repo = "zsh-256color";
          rev = "559fee48bb74b75cec8b9887f8f3e046f01d5d8f";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    dotDir = "${config.xdg.configHome}/zsh";

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "lvim";
      LS_COLORS = "$(${pkgs.vivid}/bin/vivid generate catppuccin-macchiato)";
    };
    
    initContent = lib.mkBefore ''
      source ~/.config/zsh/.p10k.zsh
      eval "$(pay-respects zsh --alias)"
      # Enable extended globbing for HISTORY_IGNORE patterns
      setopt EXTENDED_GLOB
    '';

    history = {
      size = 1000000;
      save = 1000000;
      extended = true;
      ignoreDups = true;
      ignorePatterns = [ "cd *" "steam-run *" "ls *" ];
    };

    shellAliases = {
      vim = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake .#${hostname}";
       l = "eza -lh  --icons=auto";
      ls = "eza -1   --icons=auto";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      ld = "eza -lhD --icons=auto'";
      vc = "code --disable-gpu";
      dps = "docker ps";
      wdps = "watch 'docker ps'";
      dsp = "docker system prune -a";
      dspf = "docker system prune -af";
      dkill = "docker kill $(docker ps -q)";
      drm = "docker rm $(docker ps -a -q)";
      drmi = "docker rmi $(docker images -q)";
      dcu = "docker compose up";
      dcuw = "docker compose up --wait";
      dcud = "docker compose up -d";
      dcd = "docker compose down";
      dcdvr = "docker compose down --volumes --remove-orphans";
      docker-compose = "docker compose";
      oops = "fuck";
      umatrix = "unimatrix -a -f -s 95";
      poke70 = "clear && fortune ~/.config/fortunes/70maxims | pokemonsay";
      pokelord = "clear && fortune ~/.config/fortunes/overlord | pokemonsay";
      pokeloveless = "clear && fortune ~/.config/fortunes/loveless | pokemonsay";
      luna70 = "clear && fortune ~/.config/fortunes/70maxims | ponysay -f luna";
      lunalord = "clear && fortune ~/.config/fortunes/overlord | ponysay -f luna";
      lunaloveless = "clear && fortune ~/.config/fortunes/loveless | ponysay -f luna";
      lunasith = "clear && fortune ~/.config/fortunes/sith | ponysay -f luna";
      lunasithwatch = "while true ; do lunasith;  sleep 30 ; done";
      poke70watch = "while true ; do poke70;  sleep 30 ; done";
      pokelordwatch = "while true ; do pokelord;  sleep 30 ; done";
      pokelovelesswatch = "while true ; do pokeloveless;  sleep 30 ; done";
      luna70watch="while true ; do luna70;  sleep 30 ; done";
      lunalordwatch="while true ; do lunalord;  sleep 30 ; done";
      lunalovelesswatch="while true ; do lunaloveless;  sleep 30 ; done";
      starwars = "telnet towel.blinkenlights.nl";
      rwb = "pkill waybar && hyprctl dispatch exec waybar";
    };

    profileExtra = ''
      if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        Hyprland
      fi
    '';
  };
}
