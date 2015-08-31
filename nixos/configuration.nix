# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  require = [ /root/hydra/hydra-module.nix ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      /home/rootnode/.nixpkgs/wtftw/service.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  boot.kernelPackages = pkgs.linuxPackages_4_1;

  networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "ce70cf3d";
  networking.wireless.enable = true;  # Enables wireless.

  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
    git
    subversion
    zsh
    curl
    clang
    llvm
    chromium
    tmux
    htop
    weechat
  ];

  # Enable IME support for japanese input
  programs.ibus.enable = true;
  programs.ibus.plugins = [ pkgs.ibus-anthy ];
  programs.zsh.enable = true;

  # Set default shell for all users to zsh
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  # Yes, allow unfree packages!
  nixpkgs.config.allowUnfree = true;

  # We need some music and graphics
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.bumblebee.enable = true;

  # Flash...well, the web still needs it
  nixpkgs.config.chromium = {
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  # List services that you want to enable:

  # Activate MPD for music
  services.mpd.group = "users";
  services.mpd.enable = true;
  services.mpd.musicDirectory = "/media/data/media/music";
  services.mpd.extraConfig = ''
    audio_output {
      type "pulse"
      name "pulse audio"
    }

    audio_output {
      type "fifo"
      name "my_fifo"
      path "/tmp/mpd.fifo"
      format "44100:16:2"
    }'';

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "rootnode" ];
  nixpkgs.config.virtualbox.enableExtensionPack = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the window managers
  services.xserver.windowManager.wtftw.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Enable touchpad support
  services.xserver.synaptics.enable = true;

  # Enable and configure hydra build server
  services.hydra = {
    enable = true;
    package = (import /root/hydra/release.nix {}).build.x86_64-linux;
    #dbi = "dbi:Pg:dbname=hydra;host=localhost;user=hydra;";
    hydraURL = "http://localhost:3000";
    notificationSender = "mail.wollwage@gmail.com";
  };

  # We need postgres for hydra
  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.rootnode = {
    isNormalUser = true;
    uid = 1000;
    shell = "/run/current-system/sw/bin/zsh";
    description = "Simon Wollwage";
    extraGroups = [ "wheel" "audio" "video" ];
  };

  nixpkgs.config.packageOverrides = pkgs:
    {
      wtftw = pkgs.callPackage /home/rootnode/.nixpkgs/wtftw {};
    };
}
