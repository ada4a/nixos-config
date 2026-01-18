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
    };
  };
}
