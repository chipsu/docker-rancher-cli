
FROM alpine:3

RUN wget -qO- https://github.com/rancher/rancher-compose/releases/download/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.xz | tar -xvJ --strip=2
RUN chmod +x rancher-compose
RUN ./rancher-compose -v
RUN mv rancher-compose /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/rancher-compose" ]
