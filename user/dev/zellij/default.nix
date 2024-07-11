{
  lib,
  config,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.konsole = lib.mkIf config.programs.zellij.enable {
    defaultProfile = "Zellij";
    profiles."Zellij" = {
      command = "zellij -l welcome";
    };
  };
}
