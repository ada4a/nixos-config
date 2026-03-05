{ pkgs, ... }:
let
  fdir = "~/dev/major/ferrous";
  fmail = "ada.alakbarova@ferrous-systems.com";
  # Git and Jujutsu both perform tilde expansion
  fkey = "~/.ssh/ferrous";
  fkeypub = fkey + ".pub";
in
{
  home.packages = with pkgs; [
    zoom-us # the browser version turns black randomly, maybe due to Cosmic
    _1password-gui # mainly for the ssh agent
  ];

  programs.git.includes = [
    {
      # TODO: try removing the final slash and see if it still works
      condition = "gitdir:${fdir}/";
      contents = {
        user.email = fmail;
        user.signingKey = fkeypub;
      };
    }
  ];
  programs.jujutsu.settings = {
    # ```nix
    # "--scope" = [{k = v;}];
    # ```
    # corresponds to
    # ```toml
    # [[--scope]]
    # k = v
    # ```
    # see https://toml.io/en/v1.1.0#array-of-tables
    "--scope" = [
      {
        "--when".repositories = [ fdir ];
        user.email = fmail;
        signing.key = fkeypub;
        # spawn git as a subprocess so that it's the one handling SSH -- otherwise
        # jj doesn't seem to pick up things like the configured ssh agent
        #
        # seehttps://github.com/jj-vcs/jj/pull/5228
        git.subprocess = true;
      }
    ];
  };

  programs.ssh = {
    enable = true;
    # use 1password as the ssh agent
    matchBlocks."*" =
      let
        onePassPath = "~/.1password/agent.sock";
      in
      {
        identityAgent = onePassPath;
      };

    # use ferrous key for ferrous repos
    #
    # usage example: `git clone git@fe:ferrous-systems/people`
    matchBlocks."fe" = {
      hostname = "github.com";
      identityFile = fkey;
    };
  };
}
