FROM alpine:latest

# Instale dependências necessárias
RUN apk add --no-cache curl unzip bash file

# Crie diretórios necessários
RUN mkdir -p /etc/promtail

# Copie o script de inicialização e o arquivo de configuração para o container
COPY promtail/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY promtail/promtail-config.yml /etc/promtail/promtail-config.yml

# Copie e renomeie o binário do promtail
COPY promtail-linux-amd64 /usr/local/bin/promtail

# Torne o script de inicialização e o binário do promtail executáveis
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/promtail

# Defina o script de inicialização como o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
