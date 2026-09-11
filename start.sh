
#!/bin/sh
set -eu

echo "======================================"
echo " HERMES TELEGRAM"
echo "======================================"

export HOME="/data"
export HERMES_HOME="/data/.hermes"

mkdir -p "$HERMES_HOME"

echo "Hermes home: $HERMES_HOME"

if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
    echo "ERROR: TELEGRAM_BOT_TOKEN is not configured."
    exit 1
fi

export TELEGRAM_ALLOWED_USERS="6021047784"

echo "Telegram owner: 6021047784"
echo "Starting Hermes Gateway..."

exec hermes gateway
