{ outputs, systemSettings, ... }:
{
  environment.systemPackages = with outputs.legacyPackages.${systemSettings.system}; [
    ddcci-plasmoid
  ];
}
