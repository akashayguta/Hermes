
#!/bin/bash
set -e

echo "======================================"
echo "        HERMES AGENT STARTING"
echo "======================================"

echo "Hermes version:"
hermes version || hermes --version || true

echo ""
echo "Persistent data directory:"
echo "/opt/data"

mkdir -p /opt/data

# --------------------------------------------------
# Z.AI
# --------------------------------------------------

if [ -z "$ZAI_API_KEY" ]; then
    echo "ERROR: ZAI_API_KEY is not set."
    exit 1
fi

echo "Z.AI API key detected."

# --------------------------------------------------
# Telegram
# --------------------------------------------------

if [ -z "$TELEGRAM_BOT_TOKEN" ]; then
    echo "ERROR: TELEGRAM_BOT_TOKEN is not set."
    exit 1
fi

echo "Telegram bot token detected."

# --------------------------------------------------
# Start Hermes Gateway
# --------------------------------------------------

echo ""
echo "Starting Hermes Gateway..."
echo "======================================"

exec hermes gateway run
