{ config, ... }:
{
  services.tlp = {
    enable = false;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 100;
    };
  };

  # make sure to only enable one at a time, since the two conflict
  services.power-profiles-daemon.enable = !config.services.tlp.enable;
}
