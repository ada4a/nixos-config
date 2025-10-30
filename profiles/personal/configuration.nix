# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
{
  imports = [ ../../system ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = systemSettings.bootMountPath;
  };

  # FIXME: config this in hardware-configuration.nix on next system reinstall
  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;
  # it looks like specifically LC_ALL doesn't get set by the above?
  # so set it explicitly
  i18n.extraLocaleSettings = {
    LC_ALL = systemSettings.locale;
  };

  # Wayland
  security.polkit.enable = true;
  hardware.graphics.enable = true; # when using QEMU KVM

  # Configure keymap in X11
  services.xserver.xkb.layout = "eu,ru";
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
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

  security.sudo-rs.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    inherit (userSettings) shell;
    hashedPassword = "$y$j9T$8ujHxGIKBXZLj.L/UGKWc0$PFKbDL1Bl2kr9Ovx.NVNw7FkIOHLZgF7OQ0eIwEBx66";
  };
  # don't forget to actually enable the user shell!
  programs.zsh.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
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
    btop
    eza
    dust
    fastmod
    fd
    fzf
    git
    htop
    hyfetch
    kdiff3
    neovim
    ripgrep
    tlrc
    wget
    zoxide

    home-manager
    nh
    syncthing
    wl-clipboard

    firefox
  ];

  # VM stuff
  ## clipboard sharing
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  # Envvars
  environment.sessionVariables = { };

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
  system.stateVersion = systemSettings.stateVersion;
}
