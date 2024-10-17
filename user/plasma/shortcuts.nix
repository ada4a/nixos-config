{
  programs.plasma.shortcuts = {
    kwin."Window Maximize" = [ "Meta+Up" ];
    # normally it's <Right> and <Left>, respectively
    # but in my set-up the monitors is one-above-the-other, so remap accordingly
    kwin."Window to Next Screen" = [ "Meta+Shift+Up" ];
    kwin."Window to Previous Screen" = [ "Meta+Shift+Down" ];
    "services/systemsettings.desktop"."_launch" = [ "Meta+," ];
  };
}
