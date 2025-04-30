{ pkgs, lib, ... }:
{
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
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "v0.8.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-256color";
        src = pkgs.fetchFromGitHub {
          owner = "chrisiscool";
          repo = "zsh-256color";
          rev = "559fee48bb74b75cec8b9887f8f3e046f01d5d8f";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      # {
      #   name = "powerlevel10k-config";
      #   src = "./";
      #   file = "p10k.zsh";
      # }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    dotDir = ".config/zsh";

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "lvim";
      LS_COLORS = "$(${pkgs.vivid}/bin/vivid generate catppuccin-macchiato)";
    };

    envExtra = ''
      path+=("$HOME/bin")
      path+=("$HOME/.local/share/go/bin")
      export PATH
    '';

    initContent = lib.mkBefore ''
      source ~/p10k.zsh
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    '';

    history = {
      size = 1000000;
      save = 1000000;
      ignorePatterns = [
        "cd ..*"
        "ls"
      ];
      extended = true;
      ignoreDups = true;
    };

    shellAliases = {
      vim = "nvim";
      rebuild = "sudo nixos-rebuild switch --flake .#p14";
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
      dcdvr = "docker compose down --volumes --remove-orphans'";
      docker-compose = "docker compose";
      oops = "fuck";
      umatrix = "unimatrix -a -f -s 95";
      poke70 = "clear && fortune 70maxims | pokemonsay";
      pokelord = "clear && fortune overlord | pokemonsay";
      pokeloveless = "clear && fortune loveless | pokemonsay";
      luna70 = "clear && fortune 70maxims | ponysay -f luna";
      lunalord = "clear && fortune overlord | ponysay -f luna";
      lunaloveless = "clear && fortune loveless | ponysay -f luna";
      lunasith = "clear && fortune sith | ponysay -f luna";
      lunasithwatch = "while true ; do lunasith;  sleep 30 ; done";
      poke70watch = "while true ; do poke70;  sleep 30 ; done";
      pokelordwatch = "while true ; do pokelord;  sleep 30 ; done";
      pokelovelesswatch = "while true ; do pokeloveless;  sleep 30 ; done";
      luna70watch = "while true ; do luna70;  sleep 30 ; done";
      lunalordwatch = "while true ; do lunalord;  sleep 30 ; done";
      lunalovelesswatch = "while true ; do lunaloveless;  sleep 30 ; done";
      cowlordwatch = "while true ; do cowlord;  sleep 30 ; done";
      starwars = "telnet towel.blinkenlights.nl";
    };

    profileExtra = ''
      if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        Hyprland
      fi
    '';
  };
}
