{ userSettings }: {

  services.syncthing = {
    enable = true;
    user = userSettings.username;
    dataDir = "/home/" + userSettings.username + "/Documents";
    configDir = "/home/" + userSettings.username + "/.config/syncthing";
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
        "Obsidian" = {
          path = "~/Obsidian";
          devices = [ "samsung" "ipad" ];
        };
        "Library" = {
          path = "~/Documents/Library";
          devices = [ "samsung" "ipad" ];
        };
      };
    };
  };
}
