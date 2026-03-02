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
        # the thing I use this for is cloning git repos -- otherwise Git tries to use my personal
        # key and fails
        core.sshCommand = "ssh -i ${fkey}";
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
        # it looks like there isn't an option corresponding to `core.sshCommand`...
        # no `jj git clone` for me I guess
      }
    ];
  };

  # use 1password as the ssh agent
  programs.ssh =
    let
      onePassPath = "~/.1password/agent.sock";
    in
    {
      enable = true;
      matchBlocks."*" = {
        identityAgent = onePassPath;
      };
    };
}
