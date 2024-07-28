{
  programs.plasma.window-rules = [
    {
      description = "When opening a console, go to Activity \"Default\"";
      match = {
        window-class = "konsole";
        window-types = [ "normal" ];
      };
      # apply = {
      #   activity = <activity UUID>; # move to the activity with this UUID?
      #   activityrule = 3; # apply on all Activities?
      # };
    }
    {
      description = "Share Firefox across Activities";
      match = {
        window-class = "firefox";
        window-types = [ "normal" ];
      };
      # apply = {
      #   activity = "00000000-0000-0000-0000-000000000000" (move to all activities? i.e. share across activities);
      #   activityrule = 3;
      # };
    }
    {
      description = "Share Obsidian across Activities";
      match = {
        window-class = "obsidian";
        window-types = [ "normal" ];
      };
      # apply = {
      #   activity = "00000000-0000-0000-0000-000000000000" (move to all activities? i.e. share across activities);
      #   activityrule = 3;
      # };
    }
  ];
}
