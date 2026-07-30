#!/bin/sh
set -e

echo "🚀 Heimdall v1.5.0 Starting..."
echo "📋 Railway PORT=$PORT"

# تنظیم پورت از Railway - حتماً export کن!
export XUI_PORT="${PORT:-2053}"

echo "📋 XUI_PORT=$XUI_PORT"

exec /usr/local/x-ui/x-ui.bin
