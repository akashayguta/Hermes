#!/bin/sh
set -e

echo "======================================"
echo "        HERMES AGENT STARTING"
echo "======================================"

echo "Checking Hermes installation..."

hermes version || hermes --version || true

echo ""
echo "======================================"
echo "        CHECKING CONFIGURATION"
echo "======================================"

# Persistent Hermes data
mkdir -p /opt/data

echo "Data directory: /opt/data"

# --------------------------------------------------
# Z.AI
# --------------------------------------------------

if [ -z "$ZAI_API_KEY" ]; then
    echo "ERROR: ZAI_API_KEY is not set."
    exit 1
fi

echo "Z.AI API key: detected"

# --------------------------------------------------
# Telegram
# --------------------------------------------------

if [ -z "$TELEGRAM_BOT_TOKEN" ]; then
    echo "ERROR: TELEGRAM_BOT_TOKEN is not set."
    exit 1
fi

echo "Telegram bot token: detected"

# Telegram user ID is used for access control
if [ -z "$TELEGRAM_USER_ID" ]; then
    echo "WARNING: TELEGRAM_USER_ID is not set."
    echo "The bot may not be restricted to a single user."
else
    echo "Telegram user ID: detected"
fi

# --------------------------------------------------
# Environment
# --------------------------------------------------

export HERMES_DATA_DIR="/opt/data"

echo ""
echo "======================================"
echo "        STARTING HERMES GATEWAY"
echo "======================================"

exec hermes gateway run
