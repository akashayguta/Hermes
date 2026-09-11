#!/bin/sh

set -eu

echo "=========================================="
echo " Hermes Telegram Gateway"
echo "=========================================="

export HOME="${HOME:-/data}"
export HERMES_HOME="${HERMES_HOME:-/data/.hermes}"

mkdir -p "$HERMES_HOME"
mkdir -p "$HERMES_HOME/auth"

echo "[Hermes] HOME=$HOME"
echo "[Hermes] HERMES_HOME=$HERMES_HOME"

# --------------------------------------------------
# Required Telegram configuration
# --------------------------------------------------

if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
    echo
    echo "ERROR: TELEGRAM_BOT_TOKEN is not configured."
    echo
    exit 1
fi

# Your Telegram account is the only authorized account.
export TELEGRAM_ALLOWED_USERS="6021047784"

# Explicitly do NOT enable global access.
unset TELEGRAM_ALLOW_ALL_USERS || true
unset GATEWAY_ALLOW_ALL_USERS || true

echo "[Telegram] Allowed user: 6021047784"

# --------------------------------------------------
# Gemini OAuth only
# --------------------------------------------------

echo
echo "[Gemini] Checking OAuth credentials..."

GEMINI_AUTH_FILE="$HERMES_HOME/auth/google_oauth.json"

if [ ! -f "$GEMINI_AUTH_FILE" ]; then
    echo
    echo "=========================================="
    echo " Gemini OAuth is NOT configured"
    echo "=========================================="
    echo
    echo "Run this inside the Railway service shell:"
    echo
    echo "    hermes model"
    echo
    echo "Then select:"
    echo
    echo "    Google Gemini (OAuth)"
    echo
    echo "Complete the Google login."
    echo
    echo "After authentication succeeds, restart the"
    echo "Railway deployment."
    echo
    echo "NO GEMINI_API_KEY is used by this deployment."
    echo "=========================================="
    echo

    exit 1
fi

echo "[Gemini] OAuth credential file found."

# --------------------------------------------------
# Force Gemini OAuth as the model provider
# --------------------------------------------------

echo
echo "[Hermes] Starting Telegram gateway..."
echo

exec hermes gateway
