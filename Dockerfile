FROM alpine

RUN apk add --update --no-cache git openssh make curl bash zip libstdc++ icu

VOLUME /git
WORKDIR /git

RUN adduser -h /home/build -g build -D -u 1000 build

USER build
COPY --chown=build:build files/ssh_config /home/build/.ssh/config
COPY --chown=build:build files/known_hosts /home/build/.ssh/known_hosts
COPY --chown=build:build files/gitconfig /home/build/.gitconfig

ENTRYPOINT ["make"]
CMD ["--help"]
