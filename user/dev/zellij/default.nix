{
  config,
  lib,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = lib.mkIf config.programs.plasma.enable {
    # NOTE Konsole splits the config in this weird way

    # add the profile
    "konsolerc" = {
      enable = true;
      text = ''
        [Desktop Entry]
        DefaultProfile=Zellij.profile
      '';
      target = "${config.xdg.configHome}/konsolerc";
    };

    # define the profile
    "Zellij.profile" = {
      enable = true;
      text = ''
        [General]
        Command=zellij -l welcome
        Name=Zellij
        Parent=FALLBACK/
      '';
      target = "${config.xdg.dataHome}/konsole/Zellij.profile";
    };
  };
}
