{...}: {
  imports = [(f: import ./rc2nix-ed.nix)];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    panels = [
      {
        location = "bottom";
        floating = true;
        height = 42;
      }
    ];
    workspace = {
      clickItemTo = "select";
    };
  };
}
