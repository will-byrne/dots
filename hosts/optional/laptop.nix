{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVENOR_ON_AC = "performance";
      CPU_SCALING_GOVENOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_ON_AC = "performance";
      CPU_ENERGY_PERF_ON_BAT = "power";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      CPU_BOOST_ON_AC=1;
      CPU_BOOST_ON_BAT=0;

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
}
