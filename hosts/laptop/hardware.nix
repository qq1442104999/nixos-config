{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"
  ];

  boot.kernelModules = [
    "kvm-intel"
    "ip_tables"
    "iptable_filter"
    "iptable_nat"
    "iptable_mangle"
    "bridge"
    "tun"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware.cpu.intel.updateMicrocode = true;
}
