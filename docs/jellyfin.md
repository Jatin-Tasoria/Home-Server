# Jellyfin Media Server

Jellyfin is used in this project to provide **self-hosted media streaming**. It allows media stored on the server's HDD to be organized into libraries and streamed to supported client devices.

## Purpose

The purpose of Jellyfin in this project is to:

* Provide self-hosted media streaming.
* Centralize media files on the server.
* Organize media into separate libraries.
* Allow media to be accessed from client devices.
* Demonstrate containerized media-server deployment using Docker.

---

## Storage Location

The 2 TB HDD is mounted at:

```text
/srv/storage
```

Media directories:

```text
/srv/storage
├── Movies
├── TV Shows
├── Anime
└── Anime_Movies
```

---

## Docker Deployment

Create a directory for the Jellyfin configuration:

```bash
mkdir -p ~/jellyfin
cd ~/jellyfin
```

Create the Docker Compose file:

```bash
nano docker-compose.yml
```

Example:

```yaml
services:
  jellyfin:
    image: jellyfin/jellyfin
    container_name: jellyfin
    ports:
      - "8096:8096"
    volumes:
      - ./config:/config
      - ./cache:/cache
      - /srv/storage:/media
    restart: unless-stopped
```

Start Jellyfin:

```bash
docker compose up -d
```

Check the container:

```bash
docker ps
```

---

## Initial Configuration

After starting the container, open Jellyfin in a web browser:

```text
http://<server-ip>:8096
```

Complete the initial setup wizard and create the administrator account.

---

## Media Libraries

Add the following libraries in Jellyfin:

### Movies

```text
/media/Movies
```

### TV Shows

```text
/media/TV Shows
```

### Anime

```text
/media/Anime
```

### Music

```text
/media/Music
```

The `/media` path inside the container corresponds to `/srv/storage` on the host.

---

## Useful Docker Commands

### Check Status

```bash
docker ps
```

### View Logs

```bash
docker logs jellyfin
```

### Follow Logs

```bash
docker logs -f jellyfin
```

### Stop Jellyfin

```bash
docker compose down
```

### Restart Jellyfin

```bash
docker compose restart
```

### Update Jellyfin

```bash
docker compose pull
docker compose up -d
```

---

## Verification

Verify that the media directories are accessible:

```bash
ls -lah /srv/storage
```

Check available storage:

```bash
df -h /srv/storage
```

Check the Jellyfin container:

```bash
docker ps
```

Jellyfin can then be tested by playing media from each configured library.

---

## Project Role

Jellyfin is the **media streaming component** of the Self-Hosted Personal Cloud and Media Server. It works alongside Nextcloud, which provides the project's personal cloud storage functionality. The project proposal identifies Jellyfin as the media server and Docker/Docker Compose as the containerization technology.
