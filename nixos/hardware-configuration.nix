# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_hcd" "ehci_pci" "ata_piix" "usb_storage" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/62c110bc-87c0-418c-ae2b-74ddb9149a56";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/f60221ba-c3ec-46b8-88aa-b7f448c66b7e";
      fsType = "btrfs";
    };
  fileSystems."/home/disks/ssd" =
    { device = "/dev/disk/by-label/ssd";
      fsType = "btrfs";
    };

  fileSystems."/media/data" =
    { device = "/dev/sdb1";
      fsType = "btrfs";
    };

  swapDevices = [ { device = "/dev/sda2"; } ];

  nix.maxJobs = 8;
}
