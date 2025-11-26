{
  userSettings,
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.cosmic-ext-applet-external-monitor-brightness ];

  hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-dev" ];
  services.udev.extraRules = ''
    # Enable ddc monitor brightness control
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
  users.users."${userSettings.username}".extraGroups = [ "i2c" ];
}
