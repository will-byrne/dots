{
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = builtins.concatStringsSep "" [
        "$os"
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_status"
        "$c"
        "$rust"
        "$golang"
        "$nodejs"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "$docker_context"
        "$conda"
        "$jobs"
        "$time"
        "$cmd_duration"
        "$memory_usage"
        "\${custom.end_cap}" # Added backslashes and curly braces to reference the nested module
        "$line_break$character"
      ];

      palette = "catppuccin_macchiato";

      palettes.catppuccin_macchiato = {
        color_rosewater = "#f4dbd6";
        color_flamingo = "#f0c6c6";
        color_pink = "#f5bde6";
        color_mauve = "#c6a0f6";
        color_red = "#ed8796";
        color_maroon = "#ee99a0";
        color_peach = "#f5a97f";
        color_yellow = "#eed49f";
        color_green = "#a6da95";
        color_teal = "#8bd5ca";
        color_sky = "#91d7e3";
        color_sapphire = "#7dc4e4";
        color_blue = "#8aadf4";
        color_lavender = "#b7bdf8";
        color_text = "#cad3f5";
        color_subtext1 = "#b8c0e0";
        color_subtext0 = "#a5adcb";
        color_overlay2 = "#939ab7";
        color_overlay1 = "#8087a2";
        color_overlay0 = "#6e738d";
        color_surface2 = "#5b6078";
        color_surface1 = "#494d64";
        color_surface0 = "#363a4f";
        color_base = "#24273a";
        color_mantle = "#1e2030";
        color_crust = "#181926";
      };

      os = {
        disabled = false;
        style = "bg:color_surface0 fg:color_text";
        format = "[](fg:color_surface0)[$symbol]($style)";
        symbols = {
          NixOS = " ";
          Linux = "   ";
          Windows = " ";
          Ubuntu = " ";
          SUSE = " ";
          Raspbian = "   ";
          Mint = "   ";
          Macos = "   ";
          Manjaro = " ";
          Gentoo = "   ";
          Fedora = "   ";
          Alpine = " ";
          Amazon = " ";
          Android = " ";
          Arch = "   ";
          Artix = "   ";
          EndeavourOS = " ";
          CentOS = " ";
          Debian = "   ";
          Redhat = "   ";
          RedHatEnterprise = "   ";
          Pop = " ";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:color_maroon fg:color_crust";
        style_root = "bg:color_maroon fg:color_crust";
        format = "[](fg:prev_bg bg:color_maroon)[  $user ]($style)";
      };

      hostname = {
        ssh_only = false; # Keeps the hostname active locally
        ssh_symbol = "";
        style = "bg:color_maroon fg:color_crust";
        format = "[$ssh_symbol $hostname ]($style)";
      };

      directory = {
        style = "bg:color_yellow fg:color_crust";
        read_only_style = "fg:color_red bg:color_yellow";
        format = "[](fg:prev_bg bg:color_yellow)[ $path ]($style)[$read_only]($read_only_style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        read_only = "   ";
      };

      git_branch = {
        symbol = "";
        style = "fg:color_crust bg:color_teal";
        format = "[](fg:prev_bg bg:color_teal)[ $symbol $branch ]($style)";
      };

      git_commit = {
        style = "fg:color_crust bg:color_teal";
        format = "[($tag)]($style)";
      };

      git_status = {
        style = "fg:color_crust bg:color_teal";
        format = "[($all_status$ahead_behind )]($style)";
      };

      nodejs = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      c = {
        symbol = " ";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      golang = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      php = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      java = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      kotlin = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      haskell = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version) ]($style)";
      };

      python = {
        symbol = "";
        style = "fg:color_crust bg:color_blue";
        format = "[](fg:prev_bg bg:color_blue)[ $symbol( $version)( $virtualenv) ]($style)";
      };

      docker_context = {
        symbol = "";
        style = "fg:color_crust bg:color_mauve";
        format = "[](fg:prev_bg bg:color_mauve)[ $symbol( $context) ]($style)";
      };

      conda = {
        symbol = "";
        style = "fg:color_crust bg:color_mauve";
        format = "[](fg:prev_bg bg:color_mauve)[ $symbol( $environment) ]($style)";
      };

      jobs = {
        symbol = "  ";
        style = "fg:color_crust bg:color_mauve";
        format = "[](fg:prev_bg bg:color_mauve)[ $symbol( $number) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:color_text bg:color_surface0";
        format = "[](fg:prev_bg bg:color_surface0)[  $time ]($style)";
      };

      cmd_duration = {
        style = "fg:color_text bg:color_surface0";
        format = "[ $duration ]($style)";
      };

      memory_usage = {
        symbol = "  ";
        style = "fg:bold color_red bg:color_surface0";
        format = "[$symbol \${ram}]($style)";
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[󱗃 ](bold fg:color_mauve)"; # Standard PUA Vector Unicorn shape
        error_symbol = "[󱙶  ](bold fg:color_red)"; # Standard PUA Vector Pawprint shape
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };

      # Nesting end_cap inside the proper 'custom' block schema structure
      custom = {
        end_cap = {
          when = "true";
          style = "fg:prev_bg";
          format = "[ ]($style)";
        };
      };
    };
  };
}
