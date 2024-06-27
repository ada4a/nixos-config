{
  ugura-custom,
  systemSettings,
  ...
}: {environment.systemPackages = with ugura-custom.legacyPackages.${systemSettings.system}; [ddcci-plasmoid];}
