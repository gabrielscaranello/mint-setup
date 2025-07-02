#! /bin/bash

echo "Setting up swap..."

# get the total memory in MB
total_mem_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
total_mem_mb=$((total_mem_kb / 1024))

# calculate zram size as half of total memory, capped at 8192 MB
zram_size=$((total_mem_mb / 2))
if [ "$zram_size" -gt 8192 ]; then
  zram_size=8192
fi

echo "Removing existing swap..."
sudo rm -rf /etc/sysctl.d/00-custom.conf

echo "Configire ZRAM"
sudo sed -i "s/^#\?SIZE=.*/SIZE=${zram_size}/" /etc/default/zramswap

echo "Configuring swappiness and vfs_cache_pressure..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null
sudo systemctl restart zramswap

echo "Swap configured."
