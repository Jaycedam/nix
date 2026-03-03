# NixOS on Asahi Linux with LUKS + Swap

## 1. Run Asahi Installer (UEFI Setup)

```bash
curl https://alx.sh | sh
```

- Choose "UEFI environment only" (not full Asahi Linux)
- Name it NixOS
- This creates the EFI system partition

## 2. Get NixOS Installer

Download the latest prebuilt NixOS installer ISO for aarch64 from the [nixos-apple-silicon GitHub releases](https://github.com/nix-community/nixos-apple-silicon/releases).

Then `dd` the ISO to your USB drive:
```bash
dd if=nixos-apple-silicon-*.iso of=/dev/sdX bs=1M status=progress
```

Boot the USB installer on your Mac.

## 3. Partition (from installer shell)

```bash
# Identify your partitions
sgdisk /dev/nvme0n1 -p

# Create partition to fill free space (typically creates new partition)
sgdisk /dev/nvme0n1 -n 0:0 -s
```

Identify the new partition number (type 8300, typically second to last).

## 4. Setup LUKS + LVM

```bash
# Create LUKS container on the new partition (replace X)
cryptsetup luksFormat /dev/nvme0n1pX

# Open it
cryptsetup luksOpen /dev/nvme0n1pX crypted

# Create LVM physical volume
pvcreate /dev/mapper/crypted

# Create volume group
vgcreate vg /dev/mapper/crypted

# Swap (adjust size as needed - 8GB = 1x RAM, 16GB = 2x RAM for 8GB unified memory)
lvcreate -L 8G vg -n swap

# Create root (use remaining space)
lvcreate -l 100%FREE vg -n root

# Format
mkfs.ext4 /dev/mapper/vg-root
mkswap /dev/mapper/vg-swap
```

## 5. Mount

```bash
mount /dev/mapper/vg-root /mnt
swapon /dev/mapper/vg-swap

mkdir -p /mnt/boot
mount /dev/disk/by-partuuid/$(cat /proc/device-tree/chosen/asahi,efi-system-partition) /mnt/boot
```

## 6. Generate NixOS Config

```bash
nixos-generate-config --root /mnt
```

## 7. Copy Apple Silicon Module

The module should be present in `/etc/nixos` on the installer.

```bash
cp -r /etc/nixos/apple-silicon-support /mnt/etc/nixos/
chmod -R +w /mnt/etc/nixos/apple-silicon-support/
```

## 8. Edit Configuration

Edit `/mnt/etc/nixos/configuration.nix`:

```nix
imports = [
  ./hardware-configuration.nix
  ./apple-silicon-support
];

# LUKS
boot.initrd.luks.devices.crypted.device = "/dev/nvme0n1pX";

# Swap
swapDevices = [ { device = "/dev/mapper/vg-swap"; } ];

# Boot loader
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = false;

# WiFi (recommended for Asahi)
networking.wireless.iwd.enable = true;
networking.networkmanager.wifi.backend = "iwd";

# Optional: disable firmware extraction if using flakes
# hardware.asahi.extractPeripheralFirmware = false;
```

## 9. Install

```bash
# You will be prompted to set a root password
nixos-install

reboot
```
