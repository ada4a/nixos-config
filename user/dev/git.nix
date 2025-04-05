{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.pmail;
    aliases = {
      "tree" = "log --oneline --graph --color --all --decorate";
      # https://stackoverflow.com/a/7066424
      "alias" = "config --get-regexp ^alias\.";
    };
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      merge.tool = "meld";
      push.autoSetupRemote = true;
      rerere.enabled = true;
    };
    lfs.enable = true;
  };
}
