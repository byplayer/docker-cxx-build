ARG ALPINE_TAG=3.19
FROM --platform=linux/amd64 spritsail/alpine:${ALPINE_TAG}

RUN apk --no-cache add bash cmake clang clang-dev make git gcc g++ libc-dev linux-headers

ADD entrypoint /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT [ "/usr/local/bin/entrypoint" ]
