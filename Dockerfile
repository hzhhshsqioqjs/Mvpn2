# ========================================================
# Dockerfile برای Railway - Heimdall v1.5.0
# ========================================================

FROM debian:bookworm-slim

ARG BUILD_DATE=2026-07-30-v5
ENV BUILD_DATE=${BUILD_DATE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    bash \
    ca-certificates \
    socat \
    tzdata \
    sqlite3 \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

# دانلود Heimdall v1.5.0
RUN curl -L https://github.com/sh7CBAC/Heimdall/releases/download/v1.5.0/x-ui-linux-amd64.tar.gz -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz

RUN mkdir -p /etc/x-ui /var/log/x-ui

WORKDIR /usr/local/x-ui

# باینری اصلی رو rename میکنیم
RUN mv x-ui x-ui.bin

# اسکریپت wrapper جایگزین x-ui میشه
# وقتی Railway `./x-ui` رو اجرا کنه، این اسکریپت اجرا میشه
COPY start.sh ./x-ui
RUN chmod +x ./x-ui

EXPOSE 2053

CMD ["./x-ui"]
