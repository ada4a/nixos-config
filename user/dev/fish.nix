{
  programs.fish = {
    enable = true;

    preferAbbrs = true;

    shellAbbrs =
      let
        global = expansion: {
          position = "anywhere";
          inherit expansion;
        };
      in
      {
        cat = "bat";
        cd = "z";
        du = "dust";
        ls = "eza";
        top = "htop";
        n = "nvim";
        up = "nix flake update --commit-lock-file --flake $NH_FLAKE && nh home switch && nh os switch";
        L = global "| less";
        G = global "| rg";
      };
  };
}
