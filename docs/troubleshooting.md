# Storage Mounting Issues

## 1. HDD Not Detected

### Symptoms

* HDD does not appear in `/srv/storage`.
* Storage is missing after boot.

### Check

```bash
lsblk
```

```bash
sudo fdisk -l
```

### Possible Causes

* Loose USB/SATA connection
* Drive not detected by the operating system
* Hardware failure

### Solution

* Reconnect the drive.
* Restart the system.
* Verify that the drive is detected using `lsblk`.

---

## 2. Mount Point is Empty

### Symptoms

The mount directory exists, but no files are visible.

### Check

```bash
mount | grep storage
```

```bash
df -h
```

### Possible Causes

* Drive was not mounted.
* Incorrect mount point.
* Mount failed during boot.

### Solution

```bash
sudo mount -a
```

If the problem persists, verify the `/etc/fstab` configuration.

---

## 3. Incorrect UUID in `/etc/fstab`

### Symptoms

* System boots into emergency mode.
* Drive does not mount automatically.

### Check

```bash
sudo blkid
```

Compare the UUID with the entry in:

```bash
cat /etc/fstab
```

### Solution

Update the incorrect UUID and test the configuration.

```bash
sudo mount -a
```

If no errors are displayed, the configuration is correct.

---

## 4. Read-Only File System

### Symptoms

Unable to create or modify files.

### Check

```bash
mount | grep storage
```

### Solution

Remount the drive.

```bash
sudo mount -o remount,rw /srv/storage
```

If the issue continues, inspect system logs.

```bash
dmesg | tail
```

---

## 5. Drive Does Not Mount After Reboot

### Symptoms

The drive works after manually mounting it but is unavailable after restarting.

### Check

```bash
cat /etc/fstab
```

### Solution

Ensure the `/etc/fstab` entry is correct.

Example:

```text
UUID=<drive-uuid> /srv/storage <format: ext4, ntfs, etc> defaults,nofail 0 2
```

Test the configuration.

```bash
sudo mount -a
```

---

## 6. Disk Space Full

### Symptoms

* Nextcloud uploads fail.
* Jellyfin cannot add new media.

### Check

```bash
df -h
```

Check folder sizes.

```bash
du -sh /srv/storage/*
```

### Solution

* Delete unnecessary files.
* Move data to another drive.
* Expand storage capacity.

---

### 7. Boot Failure When HDD Is Disconnected

**Symptoms**

* System enters Emergency Mode during boot.
* `/srv/storage` fails to mount.

**Check**

```bash
cat /etc/fstab
```

Verify the HDD UUID.

```bash
sudo blkid
```

**Solution**

Add the `nofail` option to the `/etc/fstab` entry to allow the system to boot even if the HDD is disconnected.

Example:

```fstab
UUID=<drive-uuid> /srv/storage ext4 defaults,nofail 0 2
```

Apply the changes.

```bash
sudo mount -a
```

---

## Useful Storage Commands

```bash
lsblk
```

List available storage devices.

```bash
df -h
```

Display mounted filesystems and disk usage.

```bash
sudo blkid
```

Show filesystem UUIDs.

```bash
mount
```

Display mounted filesystems.

```bash
sudo mount -a
```

Mount all filesystems defined in `/etc/fstab`.

```bash
du -sh /srv/storage/*
```

Display the size of each directory inside the storage mount.

```bash
journalctl -xe
```

View recent system logs for mount-related errors.
