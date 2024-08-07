ARG GO_VERSION=1.22
FROM golang:${GO_VERSION} AS build

# Baixe o código-fonte do Loki do GitHub
RUN git clone https://github.com/grafana/loki.git /src/loki

# Defina o diretório de trabalho para o diretório do código-fonte do Loki
WORKDIR /src/loki

# Limpe o ambiente de build e compile o Loki
# BUILD_IN_CONTAINER=false permite que o make use o ambiente atual em vez de outro contêiner
RUN make clean && make BUILD_IN_CONTAINER=false loki

# Use uma imagem base distroless para criar uma imagem final mais leve, sem SSL
FROM gcr.io/distroless/base-nossl:debug

# Copie o binário compilado do Loki da etapa de build anterior para o contêiner final
COPY --from=build /src/loki/cmd/loki/loki /usr/bin/loki

# Copie o arquivo de configuração do Loki para o local adequado no contêiner
COPY /loki/loki-docker-config.yml /etc/loki/local-config.yaml

# Defina o shell padrão para busybox
SHELL [ "/busybox/sh", "-c" ]

# Crie um novo grupo e usuário 'loki' para executar o processo do Loki com permissões não root
RUN addgroup -g 10001 -S loki && \
    adduser -u 10001 -S loki -G loki

# Crie os diretórios necessários para o Loki e ajuste as permissões para o usuário 'loki'
RUN mkdir -p /loki/rules && \
    mkdir -p /loki/rules-temp && \
    chown -R loki:loki /etc/loki /loki && \
    ln -s /busybox/sh /bin/sh

# Altere para o usuário não root 'loki'
USER 10001

# Exponha a porta 3100 para o serviço Loki
EXPOSE 3100

# Defina o ponto de entrada do contêiner para o binário do Loki
ENTRYPOINT [ "/usr/bin/loki" ]

# Defina o comando padrão para iniciar o Loki com o arquivo de configuração especificado
CMD ["-config.file=/etc/loki/local-config.yaml"]