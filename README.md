# Self-Hosted Personal Cloud and Media Server

A Linux-based self-hosted home server built using **Fedora Linux** to provide secure cloud storage, media streaming, and remote access while serving as a practical learning project for Linux administration, Docker, networking, and self-hosting technologies.

---

## 📖 Project Overview

The **Self-Hosted Personal Cloud and Media Server** is designed to provide a privacy-focused and cost-effective alternative to commercial cloud storage services. It enables secure file storage, synchronization, automatic backups from Android devices, and media streaming through open-source software.

The project is deployed on a Fedora Linux system using Docker containers and is intended as a hands-on learning platform for Linux system administration, containerization, networking, and server management.

---

## 🎯 Objectives

* Develop a secure self-hosted cloud storage solution.
* Provide centralized file storage and synchronization across multiple devices.
* Create automatic backups of files from Android devices.
* Enable secure media streaming and file access over local and remote networks.
* Demonstrate Linux server administration and Docker containerization.
* Build a privacy-focused alternative to commercial cloud storage platforms.

---

## 🖥️ Hardware

| Component        | Specification                  |
| ---------------- | ------------------------------ |
| Device           | Laptop                         |
| Operating System | Fedora Linux                   |
| CPU              | Intel Core i5 (8th Generation) |
| RAM              | 12 GB                          |
| SSD              | 128 GB (Operating System)      |
| Storage          | 2 TB HDD                       |

---

## 🛠️ Technologies Used

| Technology              | Purpose                      |
| ----------------------- | ---------------------------- |
| Fedora Linux            | Operating System             |
| Docker & Docker Compose | Containerization             |
| Nextcloud               | Personal Cloud Storage       |
| Jellyfin                | Media Streaming              |
| Nginx                   | Reverse Proxy                |
| SSH                     | Secure Remote Administration |
| Git & GitHub            | Version Control              |
| Bash                    | Automation & Scripting       |
| TCP/IP & LAN            | Networking                   |
| Tailscale               | Service Verification Before Reverse Proxy Configuration |

---

## 🚀 Features

* ☁️ Personal cloud storage using Nextcloud
* 🎬 Self-hosted media streaming with Jellyfin
* 📱 Automatic file backups from Android devices
* 🔒 Secure remote administration using SSH
* 🔑 Verification of services using TailScale
* 🌐 Reverse proxy support with Nginx
* 📂 Centralized storage management
* 🐳 Docker-based deployment
* 📖 Well-documented setup and configuration

---

## 📂 Storage Layout

```text
/
├── srv
│   ├── nextcloud
│   └── storage
│       ├── Movies
│       ├── TV Shows
│       ├── Anime
│       ├── Anime Movies
│       └── NEXTCLOUD
│
└── media
```

---

## 📁 Repository Structure

```text
Home-Server/
│
├── README.md
├── docs/
│   ├── installation.md
│   ├── storage.md
│   ├── networking.md
│   ├── nextcloud.md
│   ├── jellyfin.md
│   └── troubleshooting.md
│
├── scripts/
│   ├── update.sh
│   ├── check-disks.sh
│   └── backup.sh
│
├── compose/
│   ├── nextcloud/
│       └── docker-compose.yaml
│   ├── nginx/
│       └── docker-compose.yaml
│   └── jellyfin/
│       └── docker-compose.yaml
│
├── screenshots/
└── diagrams/
```

---

## 📚 Documentation

The `docs/` directory contains detailed documentation for:

* Fedora installation
* Storage configuration
* Networking
* Nextcloud deployment
* Jellyfin deployment
* Troubleshooting and maintenance

The `Troubleshooting/` directory is for common error I encountered during building and deploying this project.
---

## 🎓 Skills Demonstrated

* Linux System Administration
* Docker & Containerization
* Storage Management
* Networking Fundamentals
* Remote Server Administration
* Reverse Proxy Configuration
* Tunnelling through VPN
* Bash Scripting
* Git & GitHub
* Documentation

---

## 🔮 Future Enhancements

* Deploy **Immich** for self-hosted photo backup and management.
* Implement automated backup schedules.
* Add system monitoring and health checks.
* Configure HTTPS with Let's Encrypt.
* Explore CI/CD automation with Jenkins.
* Integrate monitoring tools such as Grafana and Prometheus.
* Expand the server with additional self-hosted services.
* Create a website to monitor resources and managing containers.

---

## 📄 License

This project is intended for educational and personal learning purposes.

---