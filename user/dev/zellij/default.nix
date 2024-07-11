{...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.konsole = {
    defaultProfile = "Zellij";
    profiles."Zellij" = {
      command = "zellij -l welcome";
    };
  };
}
