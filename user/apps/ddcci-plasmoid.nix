{
  ugura-custom,
  systemSettings,
  ...
}: {home.packages = with ugura-custom.legacyPackages.${systemSettings.system}; [ddcci-plasmoid];}
