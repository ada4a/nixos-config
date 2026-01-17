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

    interactiveShellInit = ''
      # change greeting message
      set fish_greeting "They let you write anything in here!"
    '';
  };
}
