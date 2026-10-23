# Installation

This document describes the installation and initial setup of the **Self-Hosted Personal Cloud and Media Server**.

## Prerequisites

### Hardware

* Laptop/Desktop
* Intel Core i5 Processor
* 12 GB RAM
* 128 GB SSD (Host OS)
* 2 TB HDD
* Stable Internet Connection

### Software

* Fedora Linux
* Docker
* Docker Compose
* Git
* Nginx
* Nextcloud
* Jellyfin
* SSH
* Tailscale

---

# Step 1: Install Fedora Linux

1. Download the latest Fedora Workstation ISO.
2. Create a bootable USB drive.
3. Boot from the USB drive.
4. Install Fedora using the default installer.
5. Reboot the system.

Update the system:

```bash
sudo dnf update -y
sudo dnf upgrade -y
```

---

# Step 2: Install Docker

Install Docker and Docker Compose.

```bash
sudo dnf install docker docker-compose-plugin -y
```

Enable Docker.

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Verify installation.

```bash
docker --version
docker compose version
```

---

# Step 3: Install Git

```bash
sudo dnf install git -y
```

---

# Step 4: Configure SSH

Enable the SSH service for remote administration.

```bash
sudo systemctl enable sshd
sudo systemctl start sshd
```

Verify:

```bash
systemctl status sshd
```

---

# Step 5: Configure Storage

Create the storage directory.

```bash
sudo mkdir -p /srv/storage
```

Identify the storage device.

```bash
lsblk
```

Find its UUID.

```bash
sudo blkid
```

Configure automatic mounting.

```bash
sudo nano /etc/fstab
```

Mount the drive.

```bash
sudo mount -a
```

Verify.

```bash
df -h
```

Create storage folders.

```bash
mkdir -p /srv/storage/Anime Movies
mkdir -p "/srv/storage/TV Shows"
mkdir -p /srv/storage/Anime
mkdir -p /srv/storage/Movies
mkdir -p /srv/storage/NEXTCLOUD
```

---

# Step 6: Deploy Nextcloud

Create the project directory.

```bash
mkdir ~/nextcloud
cd ~/nextcloud
```

Create the Docker Compose configuration.

```bash
nano docker-compose.yml
```

Start the service.

```bash
docker compose up -d
```

Verify.

```bash
docker ps
```

---

# Step 7: Deploy Jellyfin

Create the project directory.

```bash
mkdir ~/jellyfin
cd ~/jellyfin
```

Create the Docker Compose configuration.

```bash
nano docker-compose.yml
```

Start the service.

```bash
docker compose up -d
```

Verify.

```bash
docker ps
```

---

## Step 8: Verify Services Using Tailscale

Before configuring a reverse proxy, ensure that all services are accessible through the Tailscale network.

### Install Tailscale

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

Bring the server online.

```bash
sudo tailscale up
```

View the assigned Tailscale IP address.

```bash
tailscale ip -4
```

Check the connection status.

```bash
tailscale status
```

### Verify Nextcloud

Open a web browser on another device connected to the same Tailscale network and navigate to:

```text
http://<TAILSCALE_IP>:<NEXTCLOUD_PORT>
```

Confirm that the Nextcloud login page loads successfully.

### Verify Jellyfin

Open:

```text
http://<TAILSCALE_IP>:<JELLYFIN_PORT>
```

Confirm that the Jellyfin dashboard is accessible.

### Verify SSH

Test remote administration using SSH.

```bash
ssh <username>@<TAILSCALE_IP>
```

### Expected Outcome

Before proceeding to the reverse proxy configuration:

* ✓ Tailscale reports the server as connected.
* ✓ Nextcloud is accessible through the Tailscale IP address.
* ✓ Jellyfin is accessible through the Tailscale IP address.
* ✓ SSH connectivity is working.

If all checks are successful, continue with the Nginx reverse proxy configuration.

---