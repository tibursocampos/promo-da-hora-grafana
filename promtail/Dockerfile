# Use uma imagem base do Alpine Linux
FROM alpine:latest

# Instale dependências necessárias
RUN apk add --no-cache \
    curl \
    unzip \
    bash \
    file

# Crie o diretório de configuração do Promtail
RUN mkdir -p /etc/promtail

# Copie o script de inicialização e o arquivo de configuração para o container
COPY promtail/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY promtail/promtail-config.yml /etc/promtail/promtail-config.yml

# Torne o script de inicialização executável
RUN chmod +x /usr/local/bin/entrypoint.sh

# Exponha a porta do Promtail
EXPOSE 9080

# Defina o script de inicialização como o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
