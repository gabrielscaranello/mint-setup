#! /bin/bash

SIZE=$(cat </proc/meminfo | awk '/MemTotal/ { printf("%.0f", ($2 / 1024 / 1024 / 2)) }')

echo "Setting up swap..."

echo "Removing existing swap..."
sudo swapoff --all
sudo zramswap stop
sudo sed -i '/^PERCENT/d' /etc/default/zramswap
sudo sed -i '/^PRIORITY/d' /etc/default/zramswap

echo "Creating zramswap config..."
echo 'PERCENT=50' | sudo tee -a /etc/default/zramswap
echo 'PRIORITY=100' | sudo tee -a /etc/default/zramswap

echo "Configuring swappiness and vfs_cache_pressure..."
sudo rm -rf /etc/sysctl.d/00-custom.conf
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.d/00-custom.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/00-custom.conf

echo "Starting zramswap..."
sudo zramswap start

echo "Swap configured."
