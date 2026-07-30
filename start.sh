#!/bin/sh
set -eu

# استفاده از PORT Railway یا XUI_PORT یا پیش‌فرض 2053
PORT="${XUI_PORT:-${PORT:-2053}}"

echo "🚀 Starting Heimdall on port $PORT..."

# تنظیم پورت
export XUI_PORT=$PORT

# اجرای Heimdall
exec /usr/local/x-ui/x-ui
