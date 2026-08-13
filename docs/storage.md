# Storage Configuration

This document describes the storage configuration of the Self-Hosted Personal Cloud and Media Server.

## Storage Overview

The server uses:

* **128 GB SSD** – Fedora Linux and system/software files
* **2 TB HDD** – Media and server data

The HDD is mounted at:

```text
/srv/storage
```

---

## 1. Identify the HDD

List available storage devices:

```bash
lsblk
```

For filesystem and UUID information:

```bash
sudo blkid
```

Example:

```text
/dev/sdb1
UUID="xxxx-xxxx"
TYPE="ext4"
```

---

## 2. Create the Mount Point

Create the directory used as the HDD mount point:

```bash
sudo mkdir -p /srv/storage
```

---

## 3. Mount the HDD

Mount the partition manually:

```bash
sudo mount /dev/sdb1 /srv/storage
```

Verify the mount:

```bash
df -h
```

or:

```bash
lsblk
```

---

## 4. Configure Automatic Mounting

To automatically mount the HDD during boot, add its UUID to `/etc/fstab`.

Open the file:

```bash
sudo nano /etc/fstab
```

Add:

```fstab
UUID=<drive-uuid> /srv/storage ext4 defaults,nofail 0 2
```

### Why `nofail`?

The `nofail` option allows Fedora to continue booting if the HDD is disconnected or unavailable.
This is important because the HDD is external/non-essential to the operating system.

>If nofail not added check the Storage Mounting Issue [Troubleshooting document](./troubleshooting.md) 

Test the configuration:

```bash
sudo mount -a
```

If there are no errors, verify:

```bash
df -h
```

---

## 5. Storage Directory Structure

The HDD is organized as follows:

```text
/srv/storage
├── Movies
├── TV Shows
├── Anime
├── Anime_Movies
└── NEXTCLOUD
```

### Jellyfin

Jellyfin uses the following directories for media:

```text
/srv/storage/Movies
/srv/storage/TV Shows
/srv/storage/Anime
/srv/storage/Anime_Movies
```

### Nextcloud

Nextcloud data is stored under:

```text
/srv/storage/NEXTCLOUD
```

---

## 6. Create Directories

Create the required directories:

```bash
sudo mkdir -p /srv/storage/Movies
sudo mkdir -p "/srv/storage/TV Shows"
sudo mkdir -p /srv/storage/Anime
sudo mkdir -p /srv/storage/Anime_Movies
sudo mkdir -p /srv/storage/NEXTCLOUD
```

---

## 7. Check Storage Usage

Check available disk space:

```bash
df -h
```

Check the size of individual directories:

```bash
du -sh /srv/storage/*
```

---

## Storage Design

Separating the operating system and server data provides a cleaner setup:

```text
128 GB SSD
├── Fedora Linux
└── System / Docker files

2 TB HDD
└── /srv/storage
    ├── Movies
    ├── TV Shows
    ├── Anime
    ├── Anime_Movies
    └── NEXTCLOUD
```

This allows the HDD to be managed independently from the operating system and provides persistent storage for Nextcloud and Jellyfin.
