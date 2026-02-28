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
    signing = {
      behavior = "own";
      backend = "ssh";
      key = "~/.ssh/id_ed25519.pub";
    };
    ui = {
      default-command = "status";
      diff-editor = ":builtin";
    };
    revsets = {
      # same as default, but un-elides all the refs from main to @
      log = "trunk()::present(@) | ancestors(immutable_heads().., 2)";
    };
  };
}
