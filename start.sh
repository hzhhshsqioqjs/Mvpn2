#!/bin/sh
set -eu

# Railway پورت رو از طریق متغیر PORT میده
# اگه PORT نبود از XUI_PORT استفاده کن
PORT="${PORT:-${XUI_PORT:-2053}}"

echo "🚀 Starting Heimdall v1.5.0 on port $PORT..."

# تنظیم پورت پنل
export XUI_PORT=$PORT

# اجرای Heimdall
exec /usr/local/x-ui/x-ui
