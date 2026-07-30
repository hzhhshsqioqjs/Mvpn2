# ========================================================
# Dockerfile برای Railway - Heimdall v1.5.0
# ========================================================
FROM debian:bookworm-slim

# Cache bust - هر بار عوض کن
ARG CACHE_BUST=2026073006
ENV CACHE_BUST=${CACHE_BUST}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl bash ca-certificates socat tzdata sqlite3 \
    && ln -sf /usr/share/zoneinfo/Asia/Tehran /etc/localtime \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/sh7CBAC/Heimdall/releases/download/v1.5.0/x-ui-linux-amd64.tar.gz -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm /tmp/x-ui.tar.gz

RUN mkdir -p /etc/x-ui /var/log/x-ui
WORKDIR /usr/local/x-ui

# باینری اصلی رو نگه‌دار
RUN cp x-ui x-ui.bin

# اسکریپت wrapper جایگزین x-ui میشه
COPY start.sh ./x-ui
RUN chmod +x ./x-ui

EXPOSE 2053
CMD ["./x-ui"]
