# Use uma imagem base do Alpine Linux
FROM alpine:latest

# Instale dependências necessárias
RUN apk add --no-cache \
    curl \
    unzip \
    bash

# Instale Promtail
RUN curl -L https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip -o promtail.zip && \
    unzip promtail.zip && \
    mv promtail-linux-amd64 /usr/local/bin/promtail && \
    chmod +x /usr/local/bin/promtail && \
    rm promtail.zip

# Copie o arquivo de configuração do Promtail
COPY promtail-config.yml /etc/promtail/promtail-config.yml

# Exponha a porta do Promtail
EXPOSE 9080

# Inicie o Promtail
ENTRYPOINT ["/usr/local/bin/promtail", "-config.file=/etc/promtail/promtail-config.yml"]
