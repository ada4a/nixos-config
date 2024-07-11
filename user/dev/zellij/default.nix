{
  lib,
  config,
  ...
}: {
  programs.zellij = {
    # disable for now because of a bug
    # reference: https://github.com/zellij-org/zellij/issues/2925
    enable = false;
    enableZshIntegration = true;
  };

  programs.konsole = lib.mkIf config.programs.zellij.enable {
    defaultProfile = "Zellij";
    profiles."Zellij" = {
      command = "zellij -l welcome";
    };
  };
}
