# 🛡️ HD Vision AI SelfGuard

> **Локален изкуствен интелект (On-Premises AI) за IP камери с интеграция във Frigate NVR и Telegram.**

[![Docker](https://img.shields.io/badge/Docker-24.0+-blue.svg)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Python-3.11+-yellow.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**HD Vision AI SelfGuard** трансформира стандартните IP камери (Hikvision, Dahua, Reolink и др.) в интелигентна охранителна система. Без фалшиви аларми от вятър или дъжд, без облачни месечни такси и с пълна поверителност на данните.

---

## ✨ Ключови Функции

- 🧠 **Локална AI Детекция:** Анализ на видеопотока в реално време за хора (`person`) и автомобили чрез Frigate NVR и Google Coral TPU / GPU ускорение.
- 📱 **Интерактивен Telegram Бот:**
  - Моментални снимки при засичане на обект.
  - Бутони за бърз контрол (`Постави под охрана`, `Изключи охраната`, `Статус`).
- 🔍 **Автоматично Мрежово Сканиране (Auto RTSP Discovery):** Инсталационният скрипт автоматично открива камерите в подмрежата чрез `nmap` и генерира конфигурацията.
- 🔒 **100% On-Premises / Privacy-First:** Видеопотоците никога не напускат вашия обект.

---

## 📸 Демонстрация

| Моментално известие със снимка | Интерактивно управление |
| :---: | :---: |
| ![Telegram Alert](media/telegram_alert.jpg) | ![Telegram Controls](media/telegram_controls.jpg) |

---

## 🚀 Бърза Инсталация (1-Click Setup)

За да инсталирате агента на вашия Linux сървър (Ubuntu / Debian / Mint), изпълнете следната команда:

```bash
curl -sSL [https://hd-vision-ai-selfguard.onrender.com/static/install.sh](https://hd-vision-ai-selfguard.onrender.com/static/install.sh) | bash -s -- --token=ВАШИЯ_API_ТОКЕН
