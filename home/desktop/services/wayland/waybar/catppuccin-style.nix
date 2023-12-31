''
@import "macchiato.css";

* {
    font-family: 'Caskaydia Cove Nerd Font Complete Mono Bold', 'Symbols Nerd Font', 'Recursive Mono Casual Static';
    font-size: 14px;
}

window#waybar {
    background-color: rgba(30, 30, 46, 0.8);
    color: @text;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

button {
    box-shadow: inset 0 -3px transparent;
    border: none;
    border-radius: 0;
}

button:hover {
    background: @overlay0;
    box-shadow: inset 0 -3px @overlay0;
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: @mauve;
}

#workspaces button:hover {
    background: rgba(108, 112, 134, 0.2);
}

#workspaces button.active {
    background-color: @base;
    box-shadow: inset 0 -3px @teal;
}

#workspaces button.urgent {
    background-color: @red;
}

tooltip {
    color: @text;
    background: rgba(30, 30, 46, 0.5);
    border: 3px solid @teal;
}

#clock,
#cpu,
#memory,
#network,
#pulseaudio,
#custom-background,
#custom-power,
#custom-playerlabel,
#tray {
    min-width: 100px;
    padding: 0 10px;
    color: @base;
    border-radius: 0;
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

#custom-playerlabel {
    color: @base;
    background-color: @pink;
}

#custom-background {
    color: @base;
    background-color: @flamingo;
}

#custom-power {
    color: @base;
    background-color: @red;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    color: @base;
    background-color: @peach;
}

#cpu {
    color: @base;
    background-color: @teal;
}

#memory {
    color: @base;
    background-color: @mauve;
}

#network {
    color: @base;
    background-color: @sapphire;
}

#network.disconnected {
    background-color: @subtext1;
}

#pulseaudio {
    color: @base;
    background-color: @yellow;
}

#pulseaudio.muted {
    background-color: @subtext1;
    color: @base;
}

#custom-media.custom-spotify {
    background-color: @teal;
}

#tray {
    color: @base;
    background-color: @peach;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: @red;
}

''
