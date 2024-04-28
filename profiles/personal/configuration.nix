# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ../../system/hardware-configuration.nix
    ../../system/syncthing.nix
    ../../system/power.nix
    ../../system/flatpak.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = systemSettings.bootMountPath;
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_ALL = systemSettings.locale;

  # Wayland
  security.polkit.enable = true;
  hardware.opengl.enable = true; # when using QEMU KVM

  # The X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  servies.xserver.layout = "eu, ru";

  # Enable KDE Plasma
  services.xserver = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "plasma";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = ["networkmanager" "wheel"];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = userSettings.username;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI tools
    bat
    eza
    dust
    fastmod
    git
    htop
    hyfetch
    meld
    neovim
    ripgrep
    tlrc
    wget
    zoxide

    alejandra
    home-manager
    sccache
    syncthing
    wl-clipboard
  ];

  # VM stuff
  ## clipboard sharing
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  # Envvars
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # It's ok to leave this unchanged for compatibililty reasons
  system.stateVersion = "23.11";
}
