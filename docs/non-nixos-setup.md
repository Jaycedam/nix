# Non-NixOS Standalone Home-Manager Setup

This document covers additional steps required to run this configuration on non-NixOS distributions with home-manager standalone.

> [!NOTE]
> This guide uses Fedora as the example distribution. If you're using a different distro (Ubuntu, Arch, etc.), adapt the package installation commands accordingly.

## Table of Contents

- [External Monitor Control](#external-monitor-control)
  - [1. Check if I2C Kernel Module is Loaded](#1-check-if-i2c-kernel-module-is-loaded)
  - [2. Load I2C Kernel Module on Boot](#2-load-i2c-kernel-module-on-boot)
  - [3. Add User to i2c Group](#3-add-user-to-i2c-group)
  - [4. Verify I2C Access](#4-verify-i2c-access)
- [Keyboard Layout](#keyboard-layout)

## External Monitor Control

### 1. Check if I2C Kernel Module is Loaded

```bash
lsmod | grep i2c
```

If the command returns output (e.g., `i2c_dev`), the module is already loaded and you can skip to step 2.

### 2. Load I2C Kernel Module on Boot

If the module is not loaded, create `/etc/modules-load.d/i2c.conf` to load it automatically on boot:

```bash
sudo mkdir -p /etc/modules-load.d/
echo "i2c_dev" | sudo tee /etc/modules-load.d/i2c.conf
```

### 3. Add User to i2c Group

```bash
sudo usermod -aG i2c $(whoami)
```

Then reboot your system for the group membership and kernel module to take effect.

### 4. Verify I2C Access

```bash
# Check i2c devices exist
ls /dev/i2c-*

# Test ddcutil
ddcutil detect
```

If ddcutil can detect your monitors, everything is configured correctly.

## Keyboard Layout

### Set Colemak-DH for TTY and Login Manager

```bash
sudo localectl set-keymap us-colemak_dh_iso
```

## Compositor Setup

For compositors like niri, we recommend installing via the system package manager rather than home-manager, as compositors require system-level integration:

```bash
sudo dnf install --setopt=install_weak_deps=False niri xdg-desktop-portal-gnome gnome-keyring
```
```
