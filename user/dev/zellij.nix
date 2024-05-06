{config, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  # NOTE Konsole splits the config in this weird way

  # add the profile
  home.file."konsolerc" = {
    enable = true;
    text = ''
      [Desktop Entry]
      DefaultProfile=Zellij.profile
    '';
    target = "${config.xdg.configHome}/konsolerc";
  };

  # define the profile
  home.file."Zellij.profile" = {
    enable = true;
    text = ''
      [General]
      Command=zellij -l welcome
      Name=Zellij
      Parent=FALLBACK/
    '';
    target = "${config.xdg.dataHome}/konsole/Zellij.profile";
  };
}
