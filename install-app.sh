#!/bin/bash
set -e

# Оновлення
sudo apt-get update
sudo apt-get install -y python3 python3-pip git

# Чистимо все старе
sudo rm -rf /app
rm -rf temp_repo

# Створюємо папку
sudo mkdir -p /app

# Клонуємо в temp_repo
git clone https://github.com/d4vp4/azure_task_12_deploy_app_with_vm_extention.git temp_repo

# Копіюємо з temp_repo в /app
sudo cp -r temp_repo/app/* /app/

# Ставимо залежності
sudo pip3 install -r /app/requirements.txt

# Налаштовуємо сервіс
sudo cp /app/todoapp.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable todoapp
sudo systemctl restart todoapp
