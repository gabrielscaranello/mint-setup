#! /bin/bash

echo "Starting usermod"

sudo usermod -aG docker "$USER"

echo "Services enabled."
