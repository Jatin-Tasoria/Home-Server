```bash
#!/bin/bash

echo "===== Home Server Health Check ====="

echo ""
echo "Docker Service:"
if systemctl is-active --quiet docker; then
    echo "OK: Docker is running."
else
    echo "WARNING: Docker is not running."
fi

echo ""
echo "Nextcloud Container:"
if docker inspect -f '{{.State.Running}}' nextcloud 2>/dev/null | grep -q true; then
    echo "OK: Nextcloud is running."
else
    echo "WARNING: Nextcloud is not running."
fi

echo ""
echo "Jellyfin Container:"
if docker inspect -f '{{.State.Running}}' jellyfin 2>/dev/null | grep -q true; then
    echo "OK: Jellyfin is running."
else
    echo "WARNING: Jellyfin is not running."
fi

echo ""
echo "===== Check Complete ====="
```