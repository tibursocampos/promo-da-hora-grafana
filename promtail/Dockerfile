# Use uma imagem base do Ubuntu
FROM ubuntu:latest

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Crie o diretório para o Promtail
RUN mkdir -p /etc/promtail

# Crie um diretório para o Arquivo de Posições
RUN mkdir -p /mnt/data

# Defina permissões para o diretório de posições
RUN chmod 755 /mnt/data

# Copie o script de inicialização para o contêiner
COPY promtail/entrypoint.sh /usr/local/bin/entrypoint.sh

# Copie o arquivo de configuração do Promtail para o contêiner
COPY promtail/promtail-config.yml /etc/promtail/promtail-config.yml

# Torne o script de inicialização executável
RUN chmod +x /usr/local/bin/entrypoint.sh

# Defina o script de inicialização como o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
