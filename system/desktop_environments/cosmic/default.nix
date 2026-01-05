{
  imports = [ ./cosmic-ext-applet-external-monitor-brightness.nix ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  # https://github.com/lilyinstarlight/nixos-cosmic/blob/c62f5e8c7a9a1ebc4013b617e0e054011c747d49/readme.md?plain=1#L69
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  environment.systemPackages = [
    # outputs.legacyPackages."${systemSettings.system}".clipboard-manager
  ];
}
