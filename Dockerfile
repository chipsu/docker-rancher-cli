FROM alpine:3

RUN apk update && apk add ca-certificates docker-cli && rm -rf /var/cache/apk/*

RUN wget -qO- https://releases.rancher.com/cli/v0.6.12/rancher-linux-amd64-v0.6.12.tar.gz | tar -xvz --strip=2
RUN chmod +x rancher
RUN ./rancher -v
RUN mv rancher /usr/local/bin/

RUN wget -qO- https://github.com/rancher/rancher-compose/releases/download/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.xz | tar -xvJ --strip=2
RUN chmod +x rancher-compose
RUN ./rancher-compose -v
RUN mv rancher-compose /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/rancher" ]
