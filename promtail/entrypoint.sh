#!/bin/bash

# Verifica se o binário do Promtail está no local esperado
if [ ! -f /usr/local/bin/promtail ]; then
  echo "Promtail não encontrado. Instalando novamente..."

  # Baixa e instala o Promtail novamente
  curl -L https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip -o promtail.zip
  unzip promtail.zip -d /usr/local/bin/
  chmod +x /usr/local/bin/promtail-linux-amd64

  # Renomeia o binário para o nome esperado
  mv /usr/local/bin/promtail-linux-amd64 /usr/local/bin/promtail

  # Remove o arquivo ZIP
  rm promtail.zip
else
  echo "Promtail encontrado."
fi

# Verifica o binário do Promtail
echo "listando arquivo /usr/local/bin/promtail"
ls -l /usr/local/bin/promtail
echo "verificando arquivo com utilitário file /usr/local/bin/promtail"
file /usr/local/bin/promtail

# Verifica o diretório de posições
echo "verificando diretório /mnt/data"
ls -ld /mnt/data
echo "verificando permissões do diretório /mnt/data"
stat /mnt/data

# Executa o Promtail
exec /usr/local/bin/promtail -config.file=/etc/promtail/promtail-config.yml
