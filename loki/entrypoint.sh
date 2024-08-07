#!/bin/sh
# Inicie o Loki com o arquivo de configuração correto
echo "Iniciando o Loki com o arquivo de configuração correto"
exec /usr/bin/loki -config.file=/etc/loki/loki-config.yml
