FROM alpine:3.22

RUN apk add --no-cache \
    bash \
    git \
    openssh-client \
    ca-certificates

WORKDIR /workspace

CMD ["sleep", "infinity"]