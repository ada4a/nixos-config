{ userSettings, ... }:
let
  inherit (userSettings) username;
in
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = username;
    dataDir = "/home/${username}/Documents";
    configDir = "/home/${username}/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "ipad" = {
          id = "DMXF35P-4H2QHO6-KMH6HJR-LD2VDVS-VRHMRCF-Z5IFJ44-E25UQC4-6EQMYAS";
        };
        "samsung" = {
          id = "72EXVRM-OSJKV2G-G6APYB3-MCA63VG-T725LMO-PUN7K6L-EVCFBJZ-YL4L5QO";
        };
      };
      folders = {
        # disabled while I'm using Obsidian Sync
        # "Obsidian - main" = {
        #   path = "~/Obsidian/main";
        #   devices = ["samsung" "ipad"];
        # };
        "Library" = {
          path = "~/Documents/Library";
          devices = [
            "samsung"
            "ipad"
          ];
        };
      };
    };
  };
}
