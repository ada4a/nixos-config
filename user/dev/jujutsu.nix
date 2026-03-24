{ userSettings, ... }:
{
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user.name = userSettings.name;
    user.email = userSettings.email;
    aliases = {
      # Let's use the Git backend for now
      init = [
        "git"
        "init"
      ];
      push = [
        "git"
        "push"
      ];
    };
    # Prevent pushing work in progress or anything explicitly labeled "private"
    # see https://docs.jj-vcs.dev/v0.39.0/config/#set-of-private-commits
    git.private-commits = "description('wip:*') | description('private:*')";
    signing = {
      behavior = "own";
      backend = "ssh";
      key = "~/.ssh/id_ed25519.pub";
    };
    ui = {
      default-command = "status";
      diff-editor = ":builtin";
    };
  };
}
