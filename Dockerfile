FROM debian:bookworm-slim

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        gpg \
        spamassassin && \
    apt clean && \
    apt auto-clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/spamassassin/sa-update-keys && \
    chmod 700 /etc/spamassassin/sa-update-keys && \
    chown debian-spamd:debian-spamd /etc/spamassassin/sa-update-keys

COPY spamd.sh /

COPY rule-update.sh /

COPY run.sh /

EXPOSE 783

CMD ["/run.sh"]
