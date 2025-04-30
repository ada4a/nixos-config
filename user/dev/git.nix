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
      branch.sort = "-commiterdate";
      column.ui = "auto";
      commit.verbose = true;
      core.editor = "nvim";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      help.autocorrect = "prompt";
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      merge.tool = "meld";
      pull.rebase = true;
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      tag.sort = "version:refname";
    };
    lfs.enable = true;
  };
}
