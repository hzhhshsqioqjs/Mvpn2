# ========================================================
# Dockerfile برای Railway - Heimdall v1.5.0
# ========================================================

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    bash \
    ca-certificates \
    socat \
    tzdata \
    sqlite3 \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

# دانلود و نصب Heimdall v1.5.0
RUN curl -L https://github.com/sh7CBAC/Heimdall/releases/download/v1.5.0/x-ui-linux-amd64.tar.gz -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz \
    && chmod +x /usr/local/x-ui/x-ui

RUN mkdir -p /etc/x-ui /var/log/x-ui

WORKDIR /usr/local/x-ui

EXPOSE 2053

CMD ["./x-ui"]
