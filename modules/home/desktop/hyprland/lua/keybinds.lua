local mainMod = "SUPER";
local terminal = "kitty";
local guiFM = "thunar";
local tuiFM = "yazi";
local menu = "fuzzel";
local browser = "firefox";
local ipc = "noctalia-shell ipc call";

-- 1. Noctalia Shell
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(ipc .. " plugin:keybind-cheatsheet toggle"),
  { description = "Toggle keybind cheatsheet" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " lockScreen lock"), { description = "Lock screen" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " launcher toggle"), { description = "Toggle launcher" })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"), { description = "Toggle control center" })
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings toggle"), { description = "Toggle settings" })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { description = "Mute output" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"),
  { description = "Toggle keyboard layout" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. " volume muteInput"),
  { description = "Mute mic", locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"),
  { description = "Mute sound", locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"),
  { description = "Volume up", locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"),
  { description = "Volume down", locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"),
  { description = "Brightness up", locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"),
  { description = "Brightness down", locked = true, repeating = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(ipc .. "sessionMenu lockAndSuspend"),
  { description = "Lock screen and suspend on lid close" })

-- 2. Window / Session
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mainMod .. " + G", hl.dsp.group.toggle({ action = "toggle" }), { description = "Toggle grouping" })
hl.bind("ALT +  SHIFT + return", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + backspace", hl.dsp.exec_cmd("logout"), { description = "Logout" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }), { description = "Toggle pseudotile" })

-- 3. Move workspace
hl.bind(mainMod .. " + SHIFT + CTRL + left", hl.dsp.focus({ workspace = "e-1" }), { description = "Workspace left" })
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.focus({ workspace = "e+1" }), { description = "Workspace right" })
hl.bind(mainMod .. " + SHIFT + CTRL + down", hl.dsp.focus({ workspace = "empty" }),
  { description = "New empty workspace" })

-- 4. Move workspace to monitor
hl.bind(mainMod .. " + CTRL + ALT + left", hl.dsp.workspace.move({ monitor = "l" }),
  { description = "Move workspace left monitor" })
hl.bind(mainMod .. " + CTRL + ALT + right", hl.dsp.workspace.move({ monitor = "r" }),
  { description = "Move workspace right monitor" })

-- 5. Special workspace
hl.bind(mainMod .. " + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }),
  { description = "Move to special workspace" })
hl.bind(mainMod .. " + s", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle special workspace" })

-- 6. Focus movement
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })

-- 7. Swap windows
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }), { description = "Swap left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { description = "Swap right" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "u" }), { description = "Swap up" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "d" }), { description = "Swap down" })

-- 8. Resize
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { description = "Resize right" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { description = "Resize left" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { description = "Resize up" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { description = "Resize down" })

-- 9. Workspace switching
for i = 1, 9 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Swap to workspace: " .. key })
end

-- 10. Move to workspace
for i = 1, 9 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace: " .. key })
end

-- 11. Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(guiFM), { description = "Open GUI file manager" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(terminal .. " -e " .. tuiFM),
  { description = "Open TUI file manager" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code --ozone-platform-hint=wayland"), { description = "Open VSCode" })
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("neovide"), { description = "Open Neovide" })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(browser .. " --private-window"), { description = "Browser private" })
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(terminal .. " -e btop"), { description = "System monitor" })

-- 12. Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " launcher clipboard"), { description = "Clipboard history" })

-- 13. Audio
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("pavucontrol"), { description = "Audio control panel" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("pamixer --default-source -t"), { description = "Mute mic" })
hl.bind(mainMod .. " + F9", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/Pause" })
hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track" })
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("playerctl next"), { description = "Next track" })
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("playerctl stop"), { description = "Stop playback" })
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(terminal .. "-e rmpc"), { description = "Open MPD client" })
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("ytmpv"), { description = "Play YouTube via MPD" })

--14. Screenshots
hl.bind(mainMod .. " + ALT + S",
  hl.dsp.exec_cmd("grim - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"),
  { description = "Fullscreen screenshot" })
hl.bind(mainMod .. " + SHIFT + S",
  hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | tee ~/pictures/sc/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"),
  { description = "Selection screenshot" })

-- 15. Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move Window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize Window" })
