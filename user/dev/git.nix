{userSettings}: {
  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.gmail;
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
