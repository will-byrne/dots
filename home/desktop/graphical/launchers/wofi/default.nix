{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral; # Theme.rasi alternative. Add Theme here
  colors = import ../../themes/colors.nix;
in {
  home = {
    packages = with pkgs; [
      wofi
    ];
  };

  xdg.configFile = {
    "wofi/config" = {
      text = ''
        show=drun
        width=750
        height=400
        always_parse_args=true
        show_all=false
        print_command=true
        insensitive=true
        prompt= Hmm, what do you want to run?
      '';
    };
    "wofi/style.css" = {
      text = ''
          /* Macchiato Pink */
          @define-color accent #f5bde6;
          @define-color txt #cad3f5;
          @define-color bg #24273a;
          @define-color bg2 #494d64;

          * {
            font-family: 'JetBrains Mono Nerd Font', monospace;
            font-size: 14px;
          }

          /* Window */
          window {
            margin: 0px;
            padding: 10px;
            border: 3px solid @accent;
            border-radius: 7px;
            background-color: @bg;
            animation: slideIn 0.5s ease-in-out both;
          }

          /* Slide In */
          @keyframes slideIn {
          0% {
            opacity: 0;
          }

          100% {
            opacity: 1;
          }
        }

        /* Inner Box */
        #inner-box {
            margin: 5px;
            padding: 10px;
            border: none;
            background-color: @bg;
            animation: fadeIn 0.5s ease-in-out both;
        }

        /* Fade In */
        @keyframes fadeIn {
            0% {
              opacity: 0;
            }

            100% {
              opacity: 1;
            }
        }

        /* Outer Box */
        #outer-box {
            margin: 5px;
            padding: 10px;
            border: none;
            background-color: @bg;
        }

        /* Scroll */
        #scroll {
            margin: 0px;
            padding: 10px;
            border: none;
        }

        /* Input */
        #input {
            margin: 5px;
            padding: 10px;
            border: none;
            color: @accent;
            background-color: @bg2;
            animation: fadeIn 0.5s ease-in-out both;
        }

        /* Text */
        #text {
            margin: 5px;
            padding: 10px;
            border: none;
            color: @txt;
            animation: fadeIn 0.5s ease-in-out both;
        }

        /* Selected Entry */
        #entry:selected {
          background-color: @accent;
        }

        #entry:selected #text {
            color: @bg;
        }
       '';
    };
    "wofi/menu" = {
      text = ''
                # Config for wofi-wifi-menu

        # position values:
        # 1 2 3
        # 8 0 4
        # 7 6 5
        POSITION=3

        #y-offset
        YOFF=15

        #x-offset
        XOFF=-30

        #fields to be displayed
        FIELDS=SSID,IN-USE,BARS,SECURITY
      '';
    };
    "wofi/executable_wifi" = {
      text = ''
        # Config for wofi-wifi-menu

        # position values:
        # 1 2 3
        # 8 0 4
        # 7 6 5
        POSITION=3

        #y-offset
        YOFF=65

        #x-offset
        XOFF=-40

        #fields to be displayed
        FIELDS=SSID,SECURITY,BARS
      '';
    };
    "wofi/themes/catppuccin-macchiato.css" = {
      text = ''
            window {
          margin: 0px;
          border: 5px solid #181926;
          background-color: rgba(24, 25, 38, 1.0);
          font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free Solid";
          font-size: 13px;
        }

        @keyframes gradient_f {
            0% {
                background-position: 0% 200%;
            }
            50% {
                background-position: 200% 0%;
            }
            100% {
                background-position: 400% 200%;
            }
        }

        #input {
          all: unset;
          min-height: 36px;
          padding: 4px 10px;
          margin: 4px;
          border: none;
          color: #cad3f5;
          font-weight: bold;
          background-color: #1e2030;
          outline: none;
          border-radius: 15px;
          margin: 10px;
          margin-bottom: 2px;
        }

        #inner-box {
          margin: 4px;
          padding: 10px;
          font-weight: bold;
          border-radius: 15px;
        }

        #outer-box {
          margin: 0px;
          padding: 3px;
          border: none;
          border: 5px solid #1e2030;
        }

        #scroll {
          margin-top: 5px;
          border: none;
          border-radius: 15px;
          margin-bottom: 5px;
        }

        #text:selected {
          color: #1e2030;
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
        }

        #entry {
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
          background-color: transparent;
        }

        #entry:selected {
          margin: 0px 0px;
          border: none;
          border-radius: 15px;
          /* background: linear-gradient(90deg, #7dc4e4 0%, #f5bde6 100%); */
          background: radial-gradient(circle, rgba(138, 173, 244,1) 0%, rgba(138, 173, 244,1) 12%, rgba(145, 215, 227,1) 19%, rgba(189,169,247,1) 20%, rgba(182,171,247,1) 24%, rgba(138, 173, 244,1) 36%, rgba(177,172,247,1) 37%, rgba(170,173,248,1) 48%, rgba(125, 196, 228,1) 52%, rgba(166,174,248,1) 52%, rgba(160,175,248,1) 59%, rgba(139, 213, 202,1) 66%, rgba(155,176,248,1) 67%, rgba(152,177,248,1) 68%, rgba(73, 77, 100,1) 77%, rgba(148,178,249,1) 78%, rgba(144,179,250,1) 82%, rgba(180,190,254,1) 83%, rgba(141,179,250,1) 90%, rgba(137,180,250,1) 100%);
          background-size: 400% 400%;
          animation: gradient_f linear infinite;
          animation-delay: 0s;
          animation-fill-mode: forwards;
          animation-duration: 10.0s;
        }
      '';
    };

    "wofi/themes/gruvbox.css" = {
      text = ''
        window {
            margin: 0px;
            border: 5px solid #ebdbb2;
            background-color: #282828;
            font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free Solid";
            font-size: 13px;
          }

          @keyframes gradient_f {
              0% {
                  background-position: 0% 200%;
              }
              50% {
                  background-position: 200% 0%;
              }
              100% {
                  background-position: 400% 200%;
              }
          }

          #input {
            all: unset;
            min-height: 36px;
            padding: 4px 10px;
            margin: 4px;
            border: none;
            color: #fbf1c7;
            font-weight: bold;
            background-color: #3c3836;
            outline: none;
            border-radius: 15px;
            margin: 10px;
            margin-bottom: 2px;
          }

          #inner-box {
            margin: 4px;
            padding: 10px;
            font-weight: bold;
            border-radius: 15px;
          }

          #outer-box {
            margin: 0px;
            padding: 3px;
            border: none;
            border-radius: 15px;
            border: 5px solid #3c3836;
          }

          #scroll {
            margin-top: 5px;
            border: none;
            border-radius: 15px;
            margin-bottom: 5px;
          }

          #text:selected {
            color: #3c3836;
            margin: 0px 0px;
            border: none;
            border-radius: 15px;
          }

          #entry {
            margin: 0px 0px;
            border: none;
            border-radius: 15px;
            background-color: transparent;
          }

          #entry:selected {
            margin: 0px 0px;
            border: none;
            border-radius: 15px;
            background: linear-gradient(90deg, #8ec07c 0%, #689d6a 100%);
            /* background: radial-gradient(circle, #98971a 0%, #b9bb26 12%, #8ec07c 19%, #689d6a 20%, #83a598 24%, #458588 36%, #458588 37%, #98971a 48%, #b9bb26 52%, #8ec07c 52%, #689d6a 59%, #83a598 66%, #458588 67%, rgba(152,177,248,1) 68%, rgba(73, 77, 100,1) 77%, rgba(148,178,249,1) 78%, rgba(144,179,250,1) 82%, rgba(180,190,254,1) 83%, rgba(141,179,250,1) 90%, rgba(137,180,250,1) 100%);
            background-size: 400% 400%;
            animation: gradient_f linear infinite;
            animation-delay: 0s;
            animation-fill-mode: forwards;
            animation-duration: 10.0s; */
          }
      '';
    };
  };
}
