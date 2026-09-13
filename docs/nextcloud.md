# Nextcloud

Nextcloud is used in this project as the **personal cloud storage platform**. It provides centralized file storage and synchronization across multiple devices and supports automatic file backups from Android smartphones using the Nextcloud mobile application.

## Purpose

The purpose of Nextcloud in this project is to:

* Provide self-hosted cloud storage.
* Centralize files in one location.
* Synchronize files across multiple devices.
* Automatically back up files from Android devices.
* Provide secure access to personal files.
* Demonstrate containerized cloud deployment using Docker.

---

## Storage Location

The server's 2 TB HDD is mounted at:

```text
/srv/storage
```

Nextcloud data is stored in:

```text
/srv/storage/NEXTCLOUD
```

Storage structure:

```text
/srv/storage
└── NEXTCLOUD
```

---

## Docker Deployment

Create a directory for the Nextcloud deployment:

```bash
mkdir -p ~/nextcloud
cd ~/nextcloud
```

Create the Docker Compose configuration:

```bash
nano docker-compose.yml
```

Example:

```yaml
services:
  nextcloud:
    image: nextcloud
    container_name: nextcloud
    ports:
      - "8080:80"
    volumes:
      - /srv/storage/NEXTCLOUD:/var/www/html/data
    restart: unless-stopped
```

Start the container:

```bash
docker compose up -d
```

Check the running container:

```bash
docker ps
```

---

## Initial Configuration

Open Nextcloud in a web browser:

```text
http://<server-ip>:8080
```

Complete the initial setup and create the administrator account.

---

## Android Backup

The Nextcloud mobile application is used to automatically back up files from Android devices.

Typical workflow:

```text
Android Device
      │
      ▼
Nextcloud Mobile App
      │
      ▼
Nextcloud Server
      │
      ▼
/srv/storage/NEXTCLOUD
```

This provides centralized storage and automatic backup of files from Android devices.

---

## File Synchronization

Nextcloud allows files to be accessed and synchronized across multiple devices.

Example:

```text
Laptop ──────┐
             │
Android ─────┼──► Nextcloud Server
             │
Desktop ─────┘
                    │
                    ▼
             /srv/storage/NEXTCLOUD
```

---

## Useful Docker Commands

### Check Status

```bash
docker ps
```

### View Logs

```bash
docker logs nextcloud
```

### Follow Logs

```bash
docker logs -f nextcloud
```

### Restart Nextcloud

```bash
docker compose restart
```

### Stop Nextcloud

```bash
docker compose down
```

### Start Nextcloud

```bash
docker compose up -d
```

---

## Storage Verification

Check whether the HDD is mounted:

```bash
df -h /srv/storage
```

Check the Nextcloud directory:

```bash
ls -lah /srv/storage/NEXTCLOUD
```

Check directory size:

```bash
du -sh /srv/storage/NEXTCLOUD
```

---

## Project Role

Nextcloud provides the **personal cloud storage and file synchronization component** of the project. It works with the centralized HDD storage to provide file access and automatic Android backups. The project proposal specifically identifies Nextcloud as the cloud-storage component and describes Android mobile backups as one of the project's objectives.
