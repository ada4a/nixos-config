{
  lib,
  config,
  userSettings,
  ...
}:
let
  cfg = config.programs.git;
in
{
  programs.git.enable = true;
  programs.git.settings = {
    user.name = userSettings.name;
    user.email = userSettings.pmail;
    aliases = {
      "tree" = "log --oneline --graph --color --all --decorate";
      # https://stackoverflow.com/a/7066424
      "alias" = "config --get-regexp ^alias\.";
      # https://git.rwth-aachen.de/help/user/project/merge_requests/merge_request_troubleshooting.md#check-out-locally-by-adding-a-git-alias
      "mr" = "!sh -c 'git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2' -";
    };
    branch.sort = "-committerdate";
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
    merge.tool = "kdiff3";
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
  programs.git.lfs.enable = true;

  programs.zsh.shellAliases = lib.mkIf cfg.enable {
    gco = "git switch";
    gra = "git rebase --abort";
    grc = "git rebase --continue";
    gma = "git merge --abort";
    gmc = "git merge --continue";
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;
  };
}
