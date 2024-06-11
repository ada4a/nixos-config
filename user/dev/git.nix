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
      blame.ignoreRevsFile = ".git-blame-ignore-revs";
      core.editor = "nvim";
      merge.tool = "meld";
    };
  };
}
