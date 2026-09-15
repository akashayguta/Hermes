#!/bin/sh
set -eu

echo "======================================"
echo " HERMES TELEGRAM"
echo "======================================"

export HOME="/data"
export HERMES_HOME="/data/.hermes"

echo "Hermes home: $HERMES_HOME"

mkdir -p "$HERMES_HOME"
mkdir -p "$HERMES_HOME/logs"
mkdir -p "$HERMES_HOME/cron"

echo "Checking volume permissions..."
touch "$HERMES_HOME/.write_test"
rm -f "$HERMES_HOME/.write_test"

if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
    echo "ERROR: TELEGRAM_BOT_TOKEN is not configured."
    exit 1
fi

export TELEGRAM_ALLOWED_USERS="${TELEGRAM_ALLOWED_USERS:-6021047784}"

echo "Telegram owner: $TELEGRAM_ALLOWED_USERS"
echo "Starting Hermes Gateway..."

exec hermes gateway
