#!/bin/bash
set -e

echo "=================================================="
echo "   🛡️ HD Vision AI SelfGuard On-Premises Agent    "
echo "=================================================="

CLIENT_TOKEN=""

# Парсване на аргументите (--token=XYZ)
for arg in "$@"
do
    case $arg in
        --token=*)
        CLIENT_TOKEN="${arg#*=}"
        shift
        ;;
    esac
done

if [ -z "$CLIENT_TOKEN" ]; then
    echo "❌ Грешка: Липсва валиден токен! Използвайте: curl -sSL https://.../install.sh | bash -s -- --token=YOUR_TOKEN"
    exit 1
fi

echo "🔍 1. Проверка на системните изисквания..."
if ! command -v docker &> /dev/null; then
    echo "⚙️ Docker не е намерен. Инсталиране..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
fi

echo "📦 2. Изтегляне на конфигурационни файлове..."
mkdir -p /opt/hdvision-agent && cd /opt/hdvision-agent

# Сваляне на docker-compose от твоя бекенд
curl -sSL "https://hd-vision-ai-selfguard.onrender.com/static/docker-compose.agent.yml" -o docker-compose.yml

# 3. Автоматично конфигуриране на .env файла
echo "CLIENT_TOKEN=${CLIENT_TOKEN}" > .env
echo "SERVER_URL=https://hd-vision-ai-selfguard.onrender.com" >> .env

echo "🚀 4. Стартиране на контейнерите..."
docker compose up -d

echo "✅ 5. Докладване на статус ONLINE към бекенда..."
curl -X POST "https://hd-vision-ai-selfguard.onrender.com/api/v1/agent/ping" \
     -H "Content-Type: application/json" \
     -d "{\"token\": \"${CLIENT_TOKEN}\", \"status\": \"ONLINE\"}"

echo "=================================================="
echo "🎉 Инсталацията завърши успешно!"
echo "Системата е свързана и активна."
echo "=================================================="
