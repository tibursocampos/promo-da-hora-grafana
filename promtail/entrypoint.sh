#!/bin/sh

# Verifica se o binário do Promtail está no local esperado
if [ ! -f /usr/local/bin/promtail ]; then
  echo "Promtail não encontrado. Instalando novamente..."

  # Baixa e instala o Promtail novamente
  curl -L https://github.com/grafana/loki/releases/download/v2.9.0/promtail-linux-amd64.zip -o promtail.zip
  unzip promtail.zip
  ls -l   # Adiciona este comando para verificar o conteúdo do diretório
  mv promtail-linux-amd64 /usr/local/bin/promtail
  chmod +x /usr/local/bin/promtail
  rm promtail.zip
else
  echo "Promtail encontrado."
fi

# Verifica se o binário do Promtail foi movido corretamente
ls -l /usr/local/bin/promtail

# Inicia o Promtail
exec /usr/local/bin/promtail -config.file=/etc/promtail/promtail-config.yml
