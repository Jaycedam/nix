# Non-NixOS Standalone Home-Manager Setup

This document covers additional steps required to run this configuration on non-NixOS distributions with home-manager standalone.

> [!NOTE]
> This guide covers setup for non-NixOS distributions. Commands may need adaptation for your specific distribution.

## Table of Contents

- [External Monitor Control](#external-monitor-control)
  - [1. Check if I2C Kernel Module is Loaded](#1-check-if-i2c-kernel-module-is-loaded)
  - [2. Load I2C Kernel Module on Boot](#2-load-i2c-kernel-module-on-boot)
  - [3. Add User to i2c Group](#3-add-user-to-i2c-group)
  - [4. Verify I2C Access](#4-verify-i2c-access)

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

The setup script creates the `i2c` group automatically. If you need to do this manually:

```bash
sudo groupadd i2c 2>/dev/null || true
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
