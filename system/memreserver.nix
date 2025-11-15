{
  outputs,
  systemSettings,
  ...
}:
{
  environment.systemPackages = [ outputs.legacyPackages."${systemSettings.system}".memreserver ];

  # https://git.dolansoft.org/lorenz/memreserver/-/blob/480253e565dab935df1d1c4e615ebc8a8dc81ba4/memreserver.service
  systemd.services."memreserver" = {
    # Unit
    unitConfig = {
      Description = "Sleep hook which frees up RAM needed to evacuate GPU VRAM into";
      Before = "sleep.target";
    };

    # Service
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/memreserver";
    };

    # Install
    wantedBy = [ "sleep.target" ];
  };
}
