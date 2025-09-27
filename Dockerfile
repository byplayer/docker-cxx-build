ARG ALPINE_TAG=3.22.1
FROM --platform=linux/amd64 alpine:${ALPINE_TAG}

RUN apk --no-cache add bash cmake clang clang-dev make git gcc g++ libc-dev linux-headers && \
    rm -rf /var/cache/apk/*

ADD entrypoint /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
