{userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.gmail;
    aliases = {
      "tree" = "git log --oneline --graph --color --all --decorate";
    };
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
