{
  pkgs,
  lib,
  ...
}: {
  # Catppuccin
  programs.starship = let
    flavour = "macchiato"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
  in {
    enable = true;
    settings =
      {
        add_newline = false;
        scan_timeout = 5;
        character = {
          success_symbol = "[](#cbced3)";
          error_symbol = "[](#dd6777)";
          vicmd_symbol = "[](#ecd3a0)";
          # format = "$symbol[λ ](bold #3fdaa4) ";
          format = "$symbol[✘ ](bold #3fdaa4) ";
          # format = "$symbol[ℵ ](bold #3fdaa4) ";
          # format = "$symbol[󰊠 ](bold #7EAE90) ";
        };

        palette = "catppuccin_${flavour}";
        git_commit = {commit_hash_length = 5;};
        line_break.disabled = false;
        aws.disabled = true;
        lua.symbol = "[](blue) ";
        python.symbol = "[](blue) ";
        nix_shell.symbol = "[](blue) ";
        rust.symbol = "[](red) ";
        dart.symbol = "[](blue) ";
        # nodejs.symbol = "[󰎙](#3fdaa4) ";
        # nodejs.symbol = "[󰎙](#7aa2f7) ";
        nodejs.version_format = "v$raw(blue)";
        package.symbol = "📦 ";
        docker_context.format = "via [$symbol]($style)";
        username = {
          show_always = true;
          style_user = "bold bg:none fg:#7aa2f7";
          format = "[$user]($style)";
        };

        hostname = {
          ssh_only = false;
          style = "bold bg:none fg:#CDD6F4";
          format = "@[$hostname]($style) ";
          disabled = false;
        };

        directory = {
          read_only = " ";
          truncation_length = 3;
          truncation_symbol = "./";
          style = "bold bg:none fg:#7aa2f7";
          # style = "bold bg:none fg:#7dcfff";
          # style = "bold bg:none fg:#26bbd9";
          # style = "bold bg:none fg:#7EAE90";
          # style = "bold bg:none fg:#ec6a88";
        };
      }
      // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "starship";
          rev = "HEAD";
          sha256 = "sha256-1w0TJdQP5lb9jCrCmhPlSexf0PkAlcz8GBDEsRjPRns=";
        }
        + /themes/${flavour}.toml));
  };

  # Decay
  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     add_newline = false;
  #     format = ''
  #       [](#7aa2f7)[  ](bg:#7aa2f7 fg:black)[](bg:black fg:#7aa2f7)$directory[](black) $git_branch$nix_shell
  #       $character
  #     '';
  #     directory = {
  #       format = "[ $path ]($style)";
  #       style = "bg:black";
  #       truncate_to_repo = false;
  #     };
  #     git_branch = {
  #       style = "bold yellow";
  #     };
  #     character = {
  #       success_symbol = "[🠚 ](bold #7aa2f7)";
  #       error_symbol = "[🠚 ](bold #dd6777)";
  #     };
  #     nix_shell = {
  #       symbol = "[](bold #7aa2f7) ";
  #     };
  #   };
  # };
}
