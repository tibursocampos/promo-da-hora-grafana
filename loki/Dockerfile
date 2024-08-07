# FROM grafana/loki:3.1.0

# # Crie o diretório de configuração
# RUN mkdir -p /etc/loki

# # Copie o arquivo de configuração para o contêiner
# COPY loki/loki-config.yml /etc/loki/local-config.yaml

# # Copie o script de entrada para o contêiner
# COPY loki/entrypoint.sh /usr/local/bin/entrypoint.sh

# # Exiba o conteúdo e permissões do arquivo para depuração
# RUN ls -l /usr/local/bin/entrypoint.sh
# RUN ls -l /etc/loki/local-config.yaml

# # Exponha a porta usada pelo Loki
# EXPOSE 3100

# # Defina o ponto de entrada
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
ARG GO_VERSION=1.22
FROM golang:${GO_VERSION} as build

# Baixe o código-fonte do Loki do GitHub
RUN git clone https://github.com/grafana/loki.git /src/loki

WORKDIR /src/loki
RUN make clean && make BUILD_IN_CONTAINER=false loki

FROM gcr.io/distroless/base-nossl:debug

COPY --from=build /src/loki/cmd/loki/loki /usr/bin/loki
COPY /src/loki/cmd/loki/loki-docker-config.yaml /etc/loki/local-config.yaml

SHELL [ "/busybox/sh", "-c" ]

RUN addgroup -g 10001 -S loki && \
    adduser -u 10001 -S loki -G loki
RUN mkdir -p /loki/rules && \
    mkdir -p /loki/rules-temp && \
    chown -R loki:loki /etc/loki /loki && \
    ln -s /busybox/sh /bin/sh
USER 10001
EXPOSE 3100
ENTRYPOINT [ "/usr/bin/loki" ]
CMD ["-config.file=/etc/loki/local-config.yaml"]