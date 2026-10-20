```bash
#!/bin/bash

STORAGE="/srv/storage"

echo "===== Disk Usage ====="
df -h

echo ""
echo "===== Block Devices ====="
lsblk

echo ""
echo "===== Storage Mount Check ====="

if mountpoint -q "$STORAGE"; then
    echo "OK: $STORAGE is mounted."
else
    echo "WARNING: $STORAGE is not mounted."
fi

echo ""
echo "===== Storage Directory Sizes ====="

if mountpoint -q "$STORAGE"; then
    sudo du -sh "$STORAGE"/* 2>/dev/null
fi
```