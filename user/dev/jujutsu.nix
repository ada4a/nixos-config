{ userSettings, ... }:
{
  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user.name = userSettings.name;
    user.email = userSettings.email;
    aliases = {
      # Let's use the Git backend for now
      fetch = [
        "git"
        "fetch"
      ];
      init = [
        "git"
        "init"
      ];
      push = [
        "git"
        "push"
      ];
    };
    git = {
      fetch = [
        "origin"
        "upstream"
      ];
      # Prevent pushing work in progress or anything explicitly labeled "private"
      # see https://docs.jj-vcs.dev/v0.39.0/config/#set-of-private-commits
      private-commits = "description('wip:*') | description('private:*')";
    };

    # Advance to the closest pushable
    # See https://docs.jj-vcs.dev/v0.40.0/config/#bookmark-advance-default-targets
    revset-aliases = {
      # Closest revision that is mutable, described and either non-empty or a merge
      "closest_pushable(to)" = ''
        heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))
      '';
    };
    revsets.bookmarks-advance-to = "closest_pushable(@)";

    signing = {
      behavior = "own";
      backend = "ssh";
      key = "~/.ssh/id_ed25519.pub";
    };
    # show diff in `jj desc`
    # see https://docs.jj-vcs.dev/v0.39.0/config/#default-description
    templates.draft_commit_description = ''
      concat(
        builtin_draft_commit_description,
        "\nJJ: ignore-rest\n",
        diff.git(),
      )
    '';
    ui = {
      default-command = "status";
      diff-editor = ":builtin";
    };
  };
}
