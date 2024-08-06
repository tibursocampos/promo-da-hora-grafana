# Use a imagem base oficial do Grafana
FROM grafana/grafana:latest

# Copie o arquivo de configuração do Grafana para o diretório correto
COPY /grafana/grafana.ini /etc/grafana/grafana.ini

# Exponha a porta do Grafana (não obrigatório para o funcionamento, mas bom para documentação)
EXPOSE 3000

# Comando de inicialização do Grafana com o arquivo de configuração especificado
CMD ["grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]
