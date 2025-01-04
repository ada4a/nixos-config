{ config, ... }:
{
  # causes a bajillion warnings: https://github.com/nix-community/home-manager/issues/5805
  # home.preferXdgDirectories = true;

  home.sessionVariables = {
    PYTHON_HISTORY = config.xdg.stateHome + "python/history";
    CALCHISTFILE = config.xdg.stateHome + "calc/history";
  };
}
