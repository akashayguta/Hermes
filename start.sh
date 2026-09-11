
#!/bin/sh

set -eu

echo "======================================"
echo " HERMES TELEGRAM"
echo "======================================"

# Persistent Railway volume
export HOME="/data"
export HERMES_HOME="/data/.hermes"

mkdir -p "$HERMES_HOME"

echo "Hermes home: $HERMES_HOME"

# Telegram bot configuration
if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
    echo "ERROR: TELEGRAM_BOT_TOKEN is not configured."
    exit 1
fi

# Only your Telegram account is allowed.
export TELEGRAM_ALLOWED_USERS="6021047784"

echo "Telegram owner: 6021047784"

echo ""
echo "Starting Hermes Gateway..."
echo ""

exec hermes gateway
