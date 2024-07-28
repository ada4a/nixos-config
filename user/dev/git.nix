{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.gmail;
    aliases = {
      "tree" = "log --oneline --graph --color --all --decorate";
      # https://stackoverflow.com/a/7066424
      "alias" = "config --get-regexp ^alias\.";
    };
    extraConfig = {
      init.defaultBranch = "main";
      blame.ignoreRevsFile = ".git-blame-ignore-revs";
      core.editor = "nvim";
      merge.tool = "meld";
    };
  };
}
