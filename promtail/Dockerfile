# Use uma imagem base do Alpine Linux
FROM alpine:latest

# Instale dependências necessárias
RUN apk add --no-cache \
    curl \
    unzip \
    bash

# Crie o diretório de configuração
RUN mkdir -p /etc/promtail

# Copie o arquivo de configuração do Promtail
COPY promtail-config.yml /etc/promtail/promtail-config.yml

# Copie o script de inicialização para o container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Exponha a porta do Promtail
EXPOSE 9080

# Defina o script de inicialização como o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
