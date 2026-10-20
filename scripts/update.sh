```bash
#!/bin/bash

set -e

echo "===== Fedora System Update ====="
sudo dnf upgrade -y

echo ""
echo "===== Docker Status ====="
sudo systemctl status docker --no-pager

echo ""
echo "===== Running Containers ====="
docker ps

echo ""
echo "Update check completed."
```