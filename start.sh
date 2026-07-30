#!/bin/sh
set -e

# خواندن پورت از Railway (متغیر PORT)
XUI_PORT="${PORT:-${XUI_PORT:-2053}}"

echo "🚀 Starting Heimdall v1.5.0 on port $XUI_PORT..."
echo "📋 PORT=$PORT"
echo "📋 XUI_PORT=$XUI_PORT"

# اجرای باینری اصلی
exec /usr/local/x-ui/x-ui.bin
