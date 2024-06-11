{
  ugura-custom,
  systemSettings,
  ...
}: {home.packages = with ugura-custom.packages.${systemSettings.system}; [ddcci-plasmoid];}
