#!/bin/bash
# HD Vision AI SelfGuard - Automated Installation Script
echo "=================================================="
echo "   🛡️ HD Vision AI SelfGuard Installation   "
echo "=================================================="

# Проверка за Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не е намерен. Инсталирайте Docker първо."
    exit 1
fi

echo "✅ Docker е намерен. Изтегляне на конфигурацията..."
curl -sSL https://raw.githubusercontent.com/TeoMaxy/hd-vision-ai-selfguard/main/docker-compose.yml -o docker-compose.yml
curl -sSL https://raw.githubusercontent.com/TeoMaxy/hd-vision-ai-selfguard/main/config.example.yml -o config.yml

echo "🚀 Стартиране на контейнерите..."
docker compose up -d

echo "=================================================="
echo "🎉 Инсталацията завърши успешно!"
echo "Системата работи и сканира за камери."
echo "=================================================="
