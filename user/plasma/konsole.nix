{
  programs.konsole = {
    enable = true;
    defaultProfile = "Profile 1";
  };

  programs.konsole.profiles."Profile 1".extraConfig = {
    Scrolling.HistorySize = 10000;
  };

}
