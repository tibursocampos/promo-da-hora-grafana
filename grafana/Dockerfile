FROM grafana/grafana:latest

# Copie o arquivo de configuração do Grafana
COPY grafana.ini /etc/grafana/grafana.ini

# Exponha a porta do Grafana
EXPOSE 3000

# Comando de inicialização do Grafana
CMD ["grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]
