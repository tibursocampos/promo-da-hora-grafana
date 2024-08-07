FROM grafana/loki:3.1.0

# Crie o diretório de configuração
RUN mkdir -p /etc/loki

# Copie o arquivo de configuração para o contêiner
COPY loki/loki-config.yml /etc/loki/local-config.yaml

# Copie o script de entrada para o contêiner
COPY loki/entrypoint.sh /usr/local/bin/entrypoint.sh

# Exiba o conteúdo e permissões do arquivo para depuração
RUN ls -l /usr/local/bin/entrypoint.sh
RUN ls -l /etc/loki/local-config.yaml

# Exponha a porta usada pelo Loki
EXPOSE 3100

# Defina o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
