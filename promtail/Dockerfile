FROM ubuntu:latest

# Instale dependências necessárias
RUN apt-get update && apt-get install -y curl unzip bash file

# Crie diretórios necessários
RUN mkdir -p /etc/promtail

# Copie o script de inicialização e o arquivo de configuração para o container
COPY promtail/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY promtail/promtail-config.yml /etc/promtail/promtail-config.yml

# Torne o script de inicialização e o binário do promtail executáveis
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/promtail

# Defina o script de inicialização como o ponto de entrada
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
