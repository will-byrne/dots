{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "noctalia-shell ipc call lockScreen lock";
        after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
        ignore_dbus_inhibit = false;
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "noctalia-shell ipc call lockScreen lock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
          on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
        }
      ];
    };
  };
}
